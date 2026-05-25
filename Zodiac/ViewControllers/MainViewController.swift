//
//  ViewController.swift
//  Zodiac
//
//  Created by Tardes on 22/5/26.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var horoscopeList: [Horoscope] = Horoscope.getAll()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // Cuantos elementos hay que listar
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopeList.count
    }
    
    // Cuales son los datos de cada elemento
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let horoscope = horoscopeList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Horoscope Cell", for: indexPath) as! HoroscopeViewCell
        cell.render(horoscope: horoscope)
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        horoscopeList = if searchText.isEmpty {
            Horoscope.getAll()
        } else {
            Horoscope.getAll().filter({ horoscope in
                horoscope.name.lowercased().contains(searchText.lowercased()) ||
                horoscope.dates.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        horoscopeList = Horoscope.getAll()
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Show Detail") {
            let detailViewController = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let horoscope = horoscopeList[indexPath.row]
            detailViewController.horoscope = horoscope
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

