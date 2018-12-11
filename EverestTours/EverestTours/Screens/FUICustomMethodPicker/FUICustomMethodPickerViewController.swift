//
//  FUICustomMethodPickerViewController.swift
//  EverestTours
//
//  Created by kevin on 12/11/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import UIKit
import FirebaseUI

class FUICustomMethodPickerViewController: FUIAuthPickerViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}
