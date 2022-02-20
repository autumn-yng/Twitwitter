//
//  LoginViewController.swift
//  Twitter
//
//  Created by Autumn Y Ngoc on 2/19/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // check if the user is still logged in
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true{
            // if yes: let them go to the home screen rightaway without needing to authenticate
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    // this connection is an Action, not Outlet
    // Action is what will happen when the user click on the object tied to the Action (in this case: the login button)
    @IBAction func onLoginButton(_ sender: Any) {
        
        let myUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            /* every time the user clicks on the Login button,
             a variable named "userLoggedIn" will be created and set as true.
             We create this so that if the user doesn't need to log in again every time if they don't log out when they quit the app.*/
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { Error in
            print("Cannot authenticate user")
        })
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
