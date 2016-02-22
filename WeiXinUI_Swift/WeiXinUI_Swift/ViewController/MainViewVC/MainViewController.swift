//
//  MainViewController.swift
//  WeiXinUI_Swift
//
//  Created by bob on 16/2/19.
//  Copyright © 2016年 __company__. All rights reserved.
//

import UIKit

class MainViewController: RDVTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recentVC = RecentMessageViewController()
        let recentNav = UINavigationController(rootViewController: recentVC)
        
        let contactVC = ContactViewController()
        let contactNav = UINavigationController(rootViewController: contactVC)
        
        let discoverVC = DiscoverViewController()
        let discoverNav = UINavigationController(rootViewController: discoverVC)
        
        let meVC = MeViewController()
        let meNav = UINavigationController(rootViewController: meVC)
        
        self.viewControllers = [recentNav,contactNav,discoverNav,meNav]
        
        self.customizeTabBarForController()
    }
    
    func customizeTabBarForController() {
        
        let backgroundImage = UIImage(named: "tabbar_background")
        
        let tabBarItemImages = ["tabbar_mainframe","tabbar_contacts","tabbar_discover","tabbar_me"]
        
        let tabBarItemTitles = ["消息","联系人","发现","我"]
        
//        var index = 0
//        for item in self.tabBar.items{
//            
//            item.setBackgroundSelectedImage(backgroundImage, withUnselectedImage:backgroundImage)
//            
//            let selectedImage = UIImage(named: tabBarItemImages[index] + "HL")
//      
//            let unselectedimage = UIImage(named: tabBarItemImages[index])
//
//            item.setFinishedSelectedImage(selectedImage, withFinishedUnselectedImage:unselectedimage)
//            
//            item.title = tabBarItemTitles[index]
//            
//            index++
//            
//        }
        
        for (index, item) in tabBar.items.enumerate(){
            
            item.setBackgroundSelectedImage(backgroundImage, withUnselectedImage: backgroundImage)
            
            item.setFinishedSelectedImage(UIImage(named: tabBarItemImages[index]+"HL"), withFinishedUnselectedImage: UIImage(named: tabBarItemImages[index]))
            
            item.title = tabBarItemTitles[index]
            
        }
        
    }
    
    
}
