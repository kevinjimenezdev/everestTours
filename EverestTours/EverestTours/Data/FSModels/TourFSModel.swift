//
//  TourFSModel.swift
//  EverestTours
//
//  Created by kevin on 3/31/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import Foundation
import Firebase

class TourFSModel: FSModel<Tour> {
    func getToursByDate(initial: Double, final:Double, completion: @escaping ([Tour]?, Error?)->Void) {
        let tourQuery = db.collection(collectionIdentifier)
        tourQuery.whereField("date", isGreaterThan: initial).whereField("date", isLessThan: final).getDocuments { (querySnapshot, error) in
            self.adaptModelArray(querySnapshot: querySnapshot, error: error, completion: completion)
        }
    }
    
    func reserveSpot(withTourId tourId: String, quantity: Int, completion: @escaping(Bool, Error?)->Void) {
        super.get(byIdentifier: tourId) { (tours, error) in
            if let tour = tours?[0], let spotLimit = tour.spotLimit , let reservedSpots = tour.reservedSpots {
                if  spotLimit - reservedSpots >= quantity {
                    
                }
            }
        }
    }
}
