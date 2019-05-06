//
//  AppTabBarViewController.swift
//  EverestTours
//
//  Created by kevin on 1/14/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import UIKit

class AppTabBarViewController: UITabBarController {
    
    let segueToGuideidentifier = "segueToGuides"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Guides", style: .plain, target: self, action: #selector(segueToGuides))
    }
    
    @objc func segueToGuides() {
        performSegue(withIdentifier: segueToGuideidentifier, sender: self)
    }
    
    enum tabIndexes: Int {
        case calendar = 0
        case reservations = 1
        case profile = 2
    }
}
