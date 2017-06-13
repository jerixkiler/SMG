//
//  CustomTabBar.swift
//  SocialMediaGame
//
//  Created by Nexusbond on 13/06/2017.
//  Copyright © 2017 Nexusbond. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBarController {
    
   


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.layer.borderWidth = 0
        self.tabBar.layer.borderWidth = 0
        
        self.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for:.selected)
        self.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for:.normal)
        self.tabBar.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.size.height)! + 20 , width: self.tabBar.frame.size.width, height: self.tabBar.frame.size.height)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func toogleNewPost(_ sender: Any) {

        performSegue(withIdentifier: "goToNewPost", sender: nil)
        
    }
    
    
}
