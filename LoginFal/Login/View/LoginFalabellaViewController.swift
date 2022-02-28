//
//  LoginFalabellaViewController.swift
//  LoginZav
//
//  Created by Asesoftware on 25/02/22.
//  Copyright © 2022 Oscar Daza. All rights reserved.
//

import UIKit
import FirebaseUI

class LoginFalabellaViewController: UIViewController {
    
    
    private var viewModel = LoginFalabellaViewModel()
    private var router = LoginFalabellaRouter()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.bind(view: self, router: router)
        
    }
    
    @IBAction func login(_ sender: UIButton) {

        let authUI = FUIAuth.defaultAuthUI()
        
        let providers: [FUIAuthProvider] = [
            FUIEmailAuth(),
            FUIGoogleAuth(),
        ]
        authUI?.providers = providers
        // You need to adopt a FUIAuthDelegate protocol to receive callback
        authUI?.delegate = self
        // Do any additional setup after loading the view.
        let authViewController = authUI!.authViewController()
        
        present(authViewController,animated: true, completion: nil)
        
    }
    

}
extension LoginFalabellaViewController:FUIAuthDelegate{
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
         // handle user and error as necessary
        if error != nil {
            
            return
        }
        
        print("login Swift")
        
      //  performSegue(withIdentifier: "successLogin", sender: self)
       
        self.viewModel.goHome()
    }

}
