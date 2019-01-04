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
    var date: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let date = date {
            tours = TourManager.getAvailableTours(for: date)
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
            tourCell.selectedTourDelegate = self
        }
        return tourCell
    }
}

extension TourListViewController: SelectedTourDelegate {
    func selectedTour(_ tour: Tour) {
        //TODO
    }
}
