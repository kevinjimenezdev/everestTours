//
//  TourManager.swift
//  EverestTours
//
//  Created by kevin on 12/18/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import UIKit

class TourManager {
    class func getAvailableTourDates() -> DateRage {
        //mocked
        return DateRage(startDate:Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), endDate: Calendar.current.date(byAdding: .day, value: 10, to: Date()) ?? Date())
    }
    
    class func getAvailableTours(for date: Date, target: UIViewController) -> [Tour] {
        //mocked
        let guide = Guide(identifier:"0", name: "Aylmao")
        return [Tour(identifier:"0", date: Date(), route: ["Mars"], guide: guide), Tour(identifier:"0", date: Date(), route: ["Mars"], guide: guide)]
    }
    
    class func getInformation(forTour tourId: String, target: UIViewController) -> Tour {
        //mocked
        let guide = Guide(identifier:"0",name: "Aylmao")
        return Tour(identifier:"0", date: Date(), route: ["Mars"], guide: guide)
    }
    
    class func reserveSpots(forTour tour: Tour, quantity: Int, commentary: String? = nil, target: UIViewController) {
    }
    
    class func getUserReservations() -> [Tour] {
        let guide = Guide(identifier:"0", name: "Aylmao")
        return [Tour(identifier:"0", date: Date(), route: ["Mars"], guide: guide), Tour(identifier:"0", date: Date(), route: ["Jupiter"], guide: guide)]
    }
    
    class func getReservationFor(userId: String, with tourId: Tour, handler: (Reservation?) -> Void) {
        let reservation = Reservation(reservedSports: 2)
        handler(reservation)
    }
    
    class func cancelReservationFor (userId: String, with tourId: Tour, handler: () -> Void) {
        handler()
    }
}
