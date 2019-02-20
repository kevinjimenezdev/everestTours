//
//  ProfileViewController.swift
//  EverestTours
//
//  Created by kevin on 1/14/19.
//  Copyright © 2019 Avantica Mobile. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    var userManager: UserManager?
    //only for testing
    var currentError: Error?

    //called in the init for example
    func injectUserManager(userManager: UserManager) {
        self.userManager = userManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadUserData()
    }
    
    @IBAction func changeProfileImage(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @IBAction func save(_ sender: Any) {
        let profile = UserProfile(email: emailTextField.text, name: nameTextField.text, phone: phoneTextField.text, image: profileImageView.image)
        let user = User(profile: profile)
       userManager?.saveUser(user: user) { error in
            if (error != nil) {
                self.currentError = error
            }
        }
    }
    
//    @IBAction func save(_ sender: Any) {
//        let profile = UserProfile(email: emailTextField.text, name: nameTextField.text, phone: phoneTextField.text, image: profileImageView.image)
//        let user = User(profile: profile)
//        UserManager.sharedInstance.saveUser(user: user) { error in
//            //TODO:handling error
//        }
//    }
    
    func loadUserData() {
        UserManager.sharedInstance.getUser() { user, error in
            if let user = user {
                self.emailTextField.text = user.profile?.email
                self.nameTextField.text = user.profile?.name
                self.phoneTextField.text = user.profile?.phone
                self.profileImageView.image = user.profile?.getProfileImage()
                //TODO: handling error
            } else {
                self.emailTextField.text = FUIAuthenticationManager.shared.AuthDataResult?.user.email
            }
        }
    }
}

extension ProfileViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage {
            profileImageView.image = ImageProcessing.resizeImageBackendsize(image: image)
        }
    }
}
