//
//  TourReservationViewCell.swift
//  EverestTours
//
//  Created by kevin on 1/9/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import UIKit

class TourReservationTableCell: UITableViewCell {
    
    static let identifier = "TourReservatioTableCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setTourReservation(tour: Tour) {
        nameLabel.text = tour.startsAt
        if let date = tour.date {
            dateLabel.text =  AppDateFormatter.getYearName(of: date)
        }
    }
}
