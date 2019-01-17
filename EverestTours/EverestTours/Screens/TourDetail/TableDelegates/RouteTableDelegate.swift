//
//  RouteTableDelegate.swift
//  EverestTours
//
//  Created by kevin on 12/20/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import UIKit

class RouteTableDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var route: [String]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return route?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TourUbicationTableViewCell.identifier) as! TourUbicationTableViewCell
        if let name = route?[indexPath.row] {
            cell.loadUbication(name: name)
        }
        return cell
    }
    
    //func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      //  return "Tour Spots"
    //}
}
