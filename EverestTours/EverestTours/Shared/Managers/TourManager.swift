//
//  TourManager.swift
//  EverestTours
//
//  Created by kevin on 12/18/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import UIKit

class TourManager {
    
    static let sharedInstance: TourManager = {
        return TourManager()
    }()
    
    private let tourFSIdentifier = FirebaseCollectionIdentifiers.tour
    private let tourFSModel:TourFSModel
    
    init() {
        tourFSModel = TourFSModel(collectionIdentifier: tourFSIdentifier)
    }
    
    //MOCKING AND TESTING DON'T DELETE
    func saveMockTours() {
        let guide = "Colorado"
        let tour1 = Tour(identifier: "Test1", date: Date().millisecondsSince1970, route: ["Route1", "Route2"], guideName: guide)
        let tour2 = Tour(identifier: "Test2", date: Date().millisecondsSince1970, route: ["Route3", "Route4"], guideName: guide)
        tourFSModel.save(model: tour1, completion: {error in })
        tourFSModel.save(model: tour2, completion: {error in })
    }
    
    //Sets initial and final. Remember it is shown on the UTC timezone.
    func getToursFor(date: Double, completion:@escaping ([Tour]?, Error?)->Void) {
        let typeDate = Date(milliseconds: date)
        let initialDate = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: typeDate)!
        let finalDate = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: typeDate)!
        getToursForRange(initial: initialDate.millisecondsSince1970, final: finalDate.millisecondsSince1970, completion: completion)
    }
    
    func getToursForRange(initial:Double, final:Double, completion:@escaping ([Tour]?, Error?)->Void) {
        tourFSModel.getToursByDate(initial: initial, final: final, completion: completion)
    }
    
    func getTourByIdentifier(identifier: String, completion:@escaping ([Tour]?, Error?)->Void) {
        tourFSModel.get(byIdentifier: identifier, completion: completion)
    }
    
    func getToursByIdentifiers(identifiers: [String], completion:@escaping ([Tour]?, Error?)->Void) {
        var counter = 0
        var toursComplete: [Tour] = []
        if identifiers.count == 0 {
            return completion([], nil)
        }
        identifiers.forEach { (identifier) in
            getTourByIdentifier(identifier: identifier, completion: { (tours, error) in
                if error != nil {
                    completion(nil, error)
                }
                if let tour = tours?[0] {
                    toursComplete.append(tour)
                }
                counter += 1
                if counter == identifiers.count {
                    completion(toursComplete, nil)
                }
            })
        }
    }
    
    //Refactor to Reservation Model. Low Priority
    func reserveSpot(inTourID tourid: String, quantity: Int, completion:@escaping (Bool, Error?)->Void) {
        self.getTourByIdentifier(identifier: tourid) { (tours, error) in
            if var tour = tours?[0], let reservedSpots = tour.reservedSpots {
                tour.reservedSpots = reservedSpots + quantity
                self.tourFSModel.save(byIdentifier: tourid, model: tour) {
                    (error) in
                    if error == nil {
                        let reservation = Reservation(tourId: tourid, reservedSports: quantity)
                        if UserManager.currentUser?.reservations == nil {
                            UserManager.currentUser?.reservations = [reservation]
                        } else {
                            UserManager.currentUser?.reservations?.append(reservation)
                        }
                        UserManager.sharedInstance.saveCurrentUser(completion: { (error) in
                            print(error?.localizedDescription)
                            completion(error != nil, error)
                        })
                    } else {
                        return completion(false, error)
                    }
                }
            }
        }
    }
    
    func getUserReservedTours(completion:@escaping ([Tour]?, Error?)->Void) {
        var userTourIds: [String] = []
        UserManager.currentUser?.reservations?.forEach({ (reservation) in
            if let tourId = reservation.tourId {
                userTourIds.append(tourId)
            }
        })
        getToursByIdentifiers(identifiers: userTourIds, completion: completion)
    }
    
    func cancel(reservation: Reservation, completion:@escaping (Bool, Error?)->Void) {
        if let tourId = reservation.tourId, let quantity = reservation.reservedSpots {
            self.getTourByIdentifier(identifier: tourId) { (tours, error) in
                if var tour = tours?[0], let reservedSpots = tour.reservedSpots {
                    tour.reservedSpots = reservedSpots - quantity
                    self.tourFSModel.save(byIdentifier: tourId, model: tour) {
                        (error) in
                        if error == nil {
                            UserManager.currentUser?.reservations?.removeAll(where: { (reservation) -> Bool in
                                return reservation.tourId == tourId
                            })
                            UserManager.sharedInstance.saveCurrentUser(completion: { (error) in
                                print(error?.localizedDescription)
                                completion(error != nil, error)
                            })
                        } else {
                            return completion(false, error)
                        }
                    }
                }
            }
        }
    }
}
