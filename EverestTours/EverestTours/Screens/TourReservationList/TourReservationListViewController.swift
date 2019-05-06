//
//  TourReservationListViewController.swift
//  EverestTours
//
//  Created by kevin on 1/9/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import UIKit

class TourReservationListViewController: UITableViewController {
    
    var tours: [Tour]?
    var selectedTourId: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        TourManager.sharedInstance.getUserReservedTours { (tours, error) in
            self.tours = tours
            self.tableView.reloadData()
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
        let tourCell = tableView.dequeueReusableCell(withIdentifier: TourReservationTableCell.identifier, for: indexPath) as! TourReservationTableCell
        
        if let tour = tours?[indexPath.row] {
            tourCell.setTourReservation(tour: tour)
        }
        return tourCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTourId = tours?[indexPath.row].identifier
        performSegue(withIdentifier: TourReservationListConstants.tourDetailsSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == TourReservationListConstants.tourDetailsSegue {
            let tourDetailViewController = segue.destination as! TourDetailViewController
            tourDetailViewController.tourId = selectedTourId
            tourDetailViewController.isCheckingReservation = true
        }
    }
}
