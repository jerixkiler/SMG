//
//  LoginViewController.swift
//  SocialMediaGame
//
//  Created by Nexusbond on 13/06/2017.
//  Copyright © 2017 Nexusbond. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController , GIDSignInDelegate , GIDSignInUIDelegate {

    // MARK: Properties
    var databaseRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        databaseRef = Database.database().reference()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("User Sign in to Google")
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { (user1, error) in
            print("User Sign in to Firebase")
            self.databaseRef.child("Users").child((user1?.uid)!).observeSingleEvent(of: .value, with: { (snapshot) in
                let snapshot = snapshot.value as? NSDictionary
                if snapshot == nil {
                    let userDictionary = ["display_name": (user1?.displayName)! ,"email_address" : (user1?.email)! , "photo_url" : (user1?.photoURL?.absoluteString)!] as [String : Any]
                    self.databaseRef.child("Users").child((user1?.uid)!).setValue(userDictionary)
                }
                self.performSegue(withIdentifier: "goToMain", sender: nil)
            })
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func googleSignIn(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }

}

