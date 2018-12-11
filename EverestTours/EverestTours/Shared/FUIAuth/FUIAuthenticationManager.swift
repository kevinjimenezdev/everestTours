//
//  FUIAuthenticationManager.swift
//  EverestTours
//
//  Created by kevin on 12/11/18.
//  Copyright © 2018 Avantica Mobile. All rights reserved.
//

import Foundation
import FirebaseUI
import Firebase

protocol SuccessfulAuthenticationDelegate {
    func proceed(withAuthDataResult: AuthDataResult?)
}

class FUIAuthenticationManager: NSObject, FUIAuthDelegate {
    
    // MARK: - Shared
    struct shared {
        static var AuthDataResult: AuthDataResult?
    }
    
    // MARK: - Delegate
    var delegate: SuccessfulAuthenticationDelegate?
    
    
    // MARK: - FUIAuthDelegate
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let error = error {
            print(FUIAuthenticationConstants.AuthenticationErrorMessages.genericError, error)
        } else {
            shared.AuthDataResult = authDataResult
            delegate?.proceed(withAuthDataResult: authDataResult)
        }
    }
    
    // MARK: - Custom Method Screens
    func authPickerViewController(forAuthUI authUI: FUIAuth) -> FUIAuthPickerViewController {
        return FUICustomMethodPickerViewController(nibName: FUIAuthenticationConstants.FUICustomMethodPickerView,
                                                   bundle: Bundle.main,
                                                   authUI: authUI)
    }
}
