//
//  TourUbicationTableViewCell.swift
//  EverestTours
//
//  Created by kevin on 12/19/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import UIKit

class TourUbicationTableViewCell: UITableViewCell {
    
    static let identifier = "TourUbicationTableViewCell"
    
    @IBOutlet weak var ubicationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadUbication(name: String) {
        ubicationLabel.text = name
    }

}
