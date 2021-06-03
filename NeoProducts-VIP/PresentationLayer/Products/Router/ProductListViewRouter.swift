//
//  ProductListViewRouter.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import Foundation
import UIKit

protocol  IProductListViewRouter: AnyObject {
    var navigationController: UINavigationController? { get }
    
    func routeToDetail(with product_id: Int)
}

class ProductListViewRouter: IProductListViewRouter {
    weak var navigationController: UINavigationController?
    /*
     * Method name: routeToDetail
     * Description: This function use to navigate app to product detail screen
     * Parameters: Product
     * Return:  -
     */
    func routeToDetail(with product_id: Int) {
        let viewController = ProductDetailsViewController()
        ProductDetailsViewConfigurator.configureModule(product_id: product_id,
                                                       viewController: viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
