//
//  MainTabBarController.swift
//  PodcastAppLBTA
//
//  Created by Anand on 29/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UnComment Next line in iOS 11 Swift 4
        //UINavigationBar.appearance().prefersLargeTitles = true
        
        tabBar.tintColor = .purple
        
        setupViewController()
    }
    
    //Mark:- Setup Functions
    
    func setupViewController() {
        viewControllers = [
            generateNavigationController(with: PodcastsSearchController(), title: "Search", image: #imageLiteral(resourceName: "search")),
            generateNavigationController(with: ViewController(), title: "Favorites", image: #imageLiteral(resourceName: "favorites")),
            generateNavigationController(with: ViewController(), title: "Download", image: #imageLiteral(resourceName: "downloads"))
        ]

    }
    
    //Mark:- Helper Functions
    
    fileprivate func generateNavigationController(with rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        //navController.navigationBar.preferLargeTitles = true
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
}















