//
//  TourDetailViewController.swift
//  EverestTours
//
//  Created by kevin on 12/19/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import UIKit

class TourDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var guideNameLabel: UILabel!
    @IBOutlet weak var routeTable: UITableView!
    
    @IBOutlet weak var reservationSpots: UITextField!
    @IBOutlet weak var commentaryTextView: UITextView!
    @IBOutlet weak var reservationButton: UIButton!
    
    var tour: Tour?
    let routeTableDelegate = RouteTableDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        routeTable.delegate = routeTableDelegate
        routeTable.dataSource = routeTableDelegate
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateTourView()
    }
    
    func updateTourView() {
        if let tour = tour {
            hourLabel.text = AppDateFormatter.getHourString(of: tour.date)
            guideNameLabel.text = tour.guide.name
            routeTable.reloadData()
        }
    }
    
    func reserveSpot() {
        let quantity = Int(reservationSpots.text ?? "0")
        let commentary = commentaryTextView.text
    }
}



