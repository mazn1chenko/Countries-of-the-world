//
//  ViewController.swift
//  Country
//
//  Created by m223 on 22.02.2023.
//

import UIKit

class ViewController : UIViewController{

    let identifier = "MyCell"
    
    let tableView = UITableView()
    
    let countryLabel = UILabel()
    
    var countryArrayAPI = [CountryElement]()
    
    var filteredArrayCountry = [CountryElement]()
    
    let networkManager = ApiManager()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else {return false}
        return text.isEmpty
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Countries"
        view.backgroundColor = .lightGray
        

                
        networkManager.obtainsCounry { [weak self] (result) in
            
            switch result {
            case .success(let country):
                self?.countryArrayAPI = country
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                print("Error:\(error.localizedDescription)")
            }
            
        }
        setup()
        layout()
    }

    
    func setup() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: CountryTableViewCell.reuseID)
        tableView.backgroundColor = .lightGray
        tableView.rowHeight = 100
        
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.adjustsFontSizeToFitWidth = true
        countryLabel.textColor = .label
        countryLabel.font = UIFont.systemFont(ofSize: 20)
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        

        
    }
    
    func layout() {
        
        view.addSubview(tableView)
        view.addSubview(countryLabel)
        
        NSLayoutConstraint.activate([
            countryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            countryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        

        
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let countryInfo = CountryInfoVC()
        
        
        //let currentCountry = countryArrayAPI[indexPath.row]
        
        var currentCountry: CountryElement
        
        if isFiltering{
            currentCountry = filteredArrayCountry[indexPath.row]
        }else {
            currentCountry = countryArrayAPI[indexPath.row]
        }
        
        countryInfo.setCountryInfo(name: (currentCountry.name?.common)!, imageOfCountry: (currentCountry.flags?.png)!, mapsLocation: (currentCountry.maps?.googleMaps)!, language: (currentCountry.languages)!, region: (currentCountry.region?.rawValue)!)
                
        navigationController?.pushViewController(countryInfo, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredArrayCountry.count
        }
        print(countryArrayAPI.count)
        return countryArrayAPI.count
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.reuseID, for: indexPath) as! CountryTableViewCell
        
        if isFiltering {
            cell.configureCell(model: filteredArrayCountry[indexPath.row])
        } else {
            cell.configureCell(model: countryArrayAPI[indexPath.row])
        }
        
        return cell
    }
}
extension ViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(_ searchText: String){
        
        filteredArrayCountry = countryArrayAPI.filter({ (country: CountryElement) -> Bool in
            return (country.name?.common?.lowercased().contains(searchText.lowercased()))!
        })
        tableView.reloadData()
    }
}
    





