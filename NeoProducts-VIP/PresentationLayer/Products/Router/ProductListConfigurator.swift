//
//  ProductListConfigurator.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import Foundation
import UIKit

class ProductListConfigurator {
    /*
     * Method name: configureModule
     * Description: use to configure Product module all things
     * Parameters: viewController
     * Return:  -
     */
    static func configureModule(viewController: ProductListViewController) {
        let view = ProductListView()
        let router = ProductListViewRouter()
        let presenter = ProductListViewPresenter()
        
        let networkService = ProductService(networkManager: NetworkManager.shared)
        let dataService = FavouriteService()
        let connectionService = ConnectivityService()
        let interactor = ProductListViewInteractor(presenter: presenter,
                                                   productService: networkService,
                                                   connectivity: connectionService,
                                                   favouriteService: dataService)
        
        viewController.listView = view
        viewController.router = router
        viewController.interactor = interactor
        
        presenter.viewController = viewController
        view.viewController = viewController

        router.navigationController = viewController.navigationController
    }
}
