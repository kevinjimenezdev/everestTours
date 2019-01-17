//
//  TourTableViewCell.swift
//  EverestTours
//
//  Created by kevin on 12/18/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import UIKit

class TourTableViewCell: UITableViewCell {
    
    static let identifier = "TourTableViewCell"
    
    @IBOutlet weak var hourMinuteLabel: UILabel!
    @IBOutlet weak var guideNameLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!

    var tour: Tour?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setTour(_ tour: Tour) {
        self.tour = tour
        hourMinuteLabel.text = AppDateFormatter.getHourString(of: tour.date)
//        guideNameLabel.text = tour.guide
        destinationLabel.text = tour.startsAt
    }
}
