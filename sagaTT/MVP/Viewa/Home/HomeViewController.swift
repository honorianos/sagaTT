//
//  HomeViewController.swift
//  sagaTT
//
//  Created by Oswaldo Jeisson Escobar Huisa on 12/05/22.
//

import UIKit

class HomeViewController:  UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!

    private var trendings: [String] = []

    //-------------------------------------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {

        super.viewDidLoad()
        title = "Search"

        navigationController?.viewControllers.forEach({ vc in
            print(vc.self)
        })
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salir", style: .done, target: self, action: #selector(actionCancelOrder(_:)))

        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.systemBackground.cgColor

        tableView.tableHeaderView = searchBar
        tableView.register(UINib(nibName: "HomeCell", bundle: Bundle.main), forCellReuseIdentifier: "HomeCell")

        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // MARK: - User actions
    @objc func actionCancelOrder(_ sender: UIButton) {

        print(#function)
    }

    // MARK: - Data methods
    //-------------------------------------------------------------------------------------------------------------------------------------------
    func loadData() {

        trendings.removeAll()

        trendings.append("Trending")
        trendings.append("Cell Phones & Accessories")
        trendings.append("Clothing, Shoes & Jewelry")
        trendings.append("Collectible Coins")
        trendings.append("Digital Music")
        trendings.append("Electronics")
        trendings.append("Gift Cards")
        trendings.append("Grocery & Gourmet Food")
        trendings.append("Kindle Store")
        trendings.append("Kitchen & Dining")

        refreshTableView()
    }

    // MARK: - Refresh methods
    //-------------------------------------------------------------------------------------------------------------------------------------------
    func refreshTableView() {

        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension HomeViewController: UITableViewDataSource {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return trendings.count
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.bindData(search: trendings[indexPath.row])
        cell.labelSearch.textColor = (indexPath.row == 0) ? UIColor.label : AppColor.Theme
        return cell
    }
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension HomeViewController: UITableViewDelegate {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print(#function)
        dismiss(animated: true, completion: nil)
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 40
    }
}

// MARK: - UISearchControllerDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension HomeViewController: UISearchControllerDelegate {

}
