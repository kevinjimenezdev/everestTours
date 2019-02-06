//
//  ViewController.swift
//  EverestTours
//
//  Created by kevin on 12/10/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class AuthenticationViewController: UIViewController {
    
    // MARK: - Constants
    private let AuthenticationMethods = [FUIFacebookAuth(), FUIGoogleAuth()]
    private let AuthenticationManager = FUIAuthenticationManager()
    
    // MARK: - Properties
    private var authUI: FUIAuth?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAuthUI()
        presentAuthenticationScreen()
    }
    
    // MARK: - Authentication
    func setupAuthUI() {
        authUI = FUIAuth.defaultAuthUI()
        authUI?.providers = AuthenticationMethods as! [FUIAuthProvider]
        authUI?.delegate = AuthenticationManager
        AuthenticationManager.delegate = self
    }
    
    func presentAuthenticationScreen() {
        let controller = authUI!.authViewController()
        self.present(controller, animated: false, completion: nil)
    }
}

extension AuthenticationViewController: SuccessfulAuthenticationDelegate {
    func proceed(withAuthDataResult authDataResult: AuthDataResult?) {
        performSegue(withIdentifier: AuthenticationConstants.calendarSegue, sender: self)
    }
}



