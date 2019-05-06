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
    let tourManager = TourManager.sharedInstance
    var reservation: Reservation?

    override func viewDidLoad() {
        super.viewDidLoad()
        routeTable.delegate = routeTableDelegate
        routeTable.dataSource = routeTableDelegate
        commentaryTextView.layer.borderWidth = 0.5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let tourId = tourId {
            tourManager.getTourByIdentifier(identifier: tourId) { (matchTours, error) in
                self.tour = matchTours?[0]
                self.updateTourView()
                if self.isCheckingReservation {
                    if let userId = FUIAuthenticationManager.shared.AuthDataResult?.user.email, let tour = self.tour {
                        self.reservedInfoView.isHidden = false
                        self.reserveSpotView.isHidden = true
                        self.reserveSpotViewHeight.constant = 0
                        UserManager.currentUser?.reservations?.forEach({ (reservation) in
                            if reservation.tourId == tour.identifier {
                                if let spots = reservation.reservedSpots {
                                    self.reservation = reservation
                                    self.reservedSpotsLabel.text = String(spots)
                                }
                            }
                        })
                    }
                }
            }
        }
    }
    
    func updateTourView() {
        if let tour = tour, let date = tour.date {
            hourLabel.text = AppDateFormatter.getHourString(of: date)
            guideNameLabel.text = tour.guideName
            routeTableDelegate.route = tour.route
            routeTable.reloadData()
            routeTableHeight.constant = routeTable.contentSize.height
        }
    }
    
    @IBAction func reserveSpot(_ sender: Any) {
        let quantity = Int(reservationSpots.text ?? "0")
        let commentary = commentaryTextView.text
        if let tourId = tour?.identifier, let quantity = quantity {
            tourManager.reserveSpot(inTourID: tourId, quantity: quantity) { (success, error) in
                
            }
        }
    }
    
    @IBAction func cancelReservation(_ sender: Any) {
        if let reservation = reservation {
            TourManager.sharedInstance.cancel(reservation: reservation) { (success,error) in
                
            }
        }
    }
}



