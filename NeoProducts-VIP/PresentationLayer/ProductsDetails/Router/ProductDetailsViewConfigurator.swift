//
//  ProductDetailsViewConfigurator.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import Foundation
import UIKit

class ProductDetailsViewConfigurator {
    /*
     * Method name: configureModule
     * Description: use to configure Product details module all things
     * Parameters: viewController
     * Return:  -
     */
    static func configureModule(product_id:Int, viewController: ProductDetailsViewController) {
        let view = ProductDetailsView()
        let router = ProductDetailsViewRouter()
        let presenter = ProductDetailsViewPresenter()
        let interactor = ProductDetailsViewInteractor(presenter: presenter,
                                                   productService: ProductService(networkManager: NetworkManager.shared), connectivity: ConnectivityService(), product_id: product_id)
        
        viewController.detailsView = view
        viewController.router = router
        viewController.interactor = interactor
        
        presenter.viewController = viewController
        
        router.navigationController = viewController.navigationController
    }
}
