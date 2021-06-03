//
//  ProductDetailsViewPresenter.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import Foundation

class ProductDetailsViewPresenter: IProductDetailsViewPresenter {
    weak var viewController: IProductDetailsPresenterOutput?
    
    /*
     * Method name: interactor didRetrieveProductDetaails
     * Description: use to call presenter function once product data found
     * Parameters: productsDetails
     * Return:  -
     */
    func interactor(didRetrieveProducts productsDetails: ProductDetails) {
        viewController?.presenter(didRetrieveProducts: productsDetails)
    }
    
    /*
     * Method name: interactor internetConnectionRequired
     * Description: use to call presenter function if not network found
     * Parameters: error
     * Return:  -
     */
    func interactor(didFailedRetrieveProducts error: String) {
        viewController?.presenter(didFailedRetrieveProducts: error)
    }
    
    /*
     * Method name: interactor didFailedRetrieveProducts
     * Description: use to call presenter function if error found
     * Parameters: error
     * Return:  -
     */
    func interactor(internetConnectionRequired error: String) {
        viewController?.presenter(internetConnectionRequired: error)
    }
}

