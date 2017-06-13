//
//  HomeController.swift
//  SocialMediaGame
//
//  Created by Nexusbond on 13/06/2017.
//  Copyright © 2017 Nexusbond. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class HomeController: UIViewController, IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Child1")
    }

}
