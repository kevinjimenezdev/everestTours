//
//  TourListViewController.swift
//  EverestTours
//
//  Created by kevin on 12/18/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import UIKit

class TourListViewController: UITableViewController {
    
    var tours: [Tour]?
    var selectedTourId: String?
    var date: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let date = date {
            TourManager().getToursFor(date: date.millisecondsSince1970, completion: { (tours, error) in
                self.tours = tours
                self.tableView.reloadData()
            })
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tours?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tourCell = tableView.dequeueReusableCell(withIdentifier: TourTableViewCell.identifier, for: indexPath) as! TourTableViewCell
        
        if let tour = tours?[indexPath.row] {
            tourCell.setTour(tour)
        }
        return tourCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTourId = tours?[indexPath.row].identifier
        performSegue(withIdentifier: TourListConstants.tourDetailsSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == TourListConstants.tourDetailsSegue {
            let tourDetailViewController = segue.destination as! TourDetailViewController
            tourDetailViewController.tourId = selectedTourId
        }
    }
}
