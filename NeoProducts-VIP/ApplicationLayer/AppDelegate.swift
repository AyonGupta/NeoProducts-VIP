//
//  AppDelegate.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        //adding Product list controller as a root view controller
        let productListController = ProductListViewController()
        
        let navigationController = UINavigationController(rootViewController: productListController)
        navigationController.navigationBar.transparentNavigationBar()
        
        ProductListConfigurator.configureModule(viewController: productListController)
        
        window = UIWindow()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

