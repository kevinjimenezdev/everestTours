//
//  AppTabBarViewController.swift
//  EverestTours
//
//  Created by kevin on 1/14/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import UIKit

class AppTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.setHidesBackButton(true, animated: false)
    }
}
