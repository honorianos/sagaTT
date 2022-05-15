//
//  HomeViewController.swift
//  sagaTT
//
//  Created by Oswaldo Jeisson Escobar Huisa on 12/05/22.
//

import UIKit

class HomeViewController:  UIViewController, UISearchBarDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    public var username = ""
    private var monedas: [itemsMoneda] = []
    private let presenter = HomePresenter()
    private var filteredData: [itemsMoneda] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setViewDelegate(delegate: self)
        searchBar.delegate = self
        initTableSetup()
        loadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        title = "Hola \(username)"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(routeExit(_:)))
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.systemBackground.cgColor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    func initTableSetup() {
        tableView.tableHeaderView = searchBar
        tableView.register(UINib(nibName: "HomeCell", bundle: Bundle.main), forCellReuseIdentifier: "HomeCell")
    }
    
    // MARK: - User actions
    @objc func routeExit(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    // MARK: - Data methods
    func loadData() {
        monedas.removeAll()
        self.presenter.getDataMonedas()
    }

    // MARK: - Refresh methods
    func refreshTableView() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.bindData(data: filteredData[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewData = ViewDataDetail(
            codigo: filteredData[indexPath.row].codigo,
            nombre: filteredData[indexPath.row].nombre,
            unidad_medida: filteredData[indexPath.row].unidad_medida,
            fecha: filteredData[indexPath.row].fecha,
            valor: filteredData[indexPath.row].valor
        )
        let vc = DetailMonedaController()
        vc.ViewData = viewData
        navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    // MARK: - UISearchControllerDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText.isEmpty {
            filteredData = monedas
        }
        else {
            for i in monedas {
                if i.codigo.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(i)
                }
            }
        }
        self.tableView.reloadData()
    }
}



extension HomeViewController: HomePresenterDelegate {
    func presentGetMonedas(monedas: [itemsMoneda]) {
        self.monedas = monedas
        self.filteredData = monedas
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
