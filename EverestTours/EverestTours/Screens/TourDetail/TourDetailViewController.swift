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
    @IBOutlet weak var routeTableHeight: NSLayoutConstraint!
    
    @IBOutlet weak var reserveSpotView: UIView!
    @IBOutlet weak var reserveSpotViewHeight: NSLayoutConstraint!
    @IBOutlet weak var reservationSpots: UITextField!
    @IBOutlet weak var commentaryTextView: UITextView!
    @IBOutlet weak var reservationButton: UIButton!
    
    @IBOutlet weak var reservedInfoView: UIView!
    @IBOutlet weak var reservedSpotsLabel: UILabel!
    
    
    
    var tourId: String?
    var tour: Tour?
    let routeTableDelegate = RouteTableDelegate()
    var isCheckingReservation = false

    override func viewDidLoad() {
        super.viewDidLoad()
        routeTable.delegate = routeTableDelegate
        routeTable.dataSource = routeTableDelegate
        commentaryTextView.layer.borderWidth = 0.5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let tourId = tourId {
            tour = TourManager.getInformation(forTour: tourId, target: self)
            updateTourView()
        }
        if isCheckingReservation {
            if let userId = FUIAuthenticationManager.shared.AuthDataResult?.user.email, let tour = tour {
                reservedInfoView.isHidden = false
                reserveSpotView.isHidden = true
                reserveSpotViewHeight.constant = 0
                TourManager.getReservationFor(userId: userId, with: tour) { (reservation) in
                    if let reservatedSpots = reservation?.reservedSpots {
                        reservedSpotsLabel.text = String(reservatedSpots)
                    }
                }
            }
        }
    }
    
    func updateTourView() {
        if let tour = tour {
            hourLabel.text = AppDateFormatter.getHourString(of: tour.date)
            guideNameLabel.text = tour.guide.name
            routeTableDelegate.route = tour.route
            routeTable.reloadData()
            routeTableHeight.constant = routeTable.contentSize.height
        }
    }
    
    @IBAction func reserveSpot(_ sender: Any) {
        let quantity = Int(reservationSpots.text ?? "0")
        let commentary = commentaryTextView.text
        if let tour = tour, let quantity = quantity {
            TourManager.reserveSpots(forTour: tour, quantity: quantity, commentary: commentary, target: self)
        }
    }
    
    @IBAction func cancelReservation(_ sender: Any) {
        
    }
}



