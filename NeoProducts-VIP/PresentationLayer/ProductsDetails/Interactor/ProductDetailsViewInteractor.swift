//
//  ProductDetailsViewInteracter.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import Foundation

class ProductDetailsViewInteractor: IProductDetailsViewInteractor {
    
    private var presenter: IProductDetailsViewPresenter?
    private var productService: IProductDetailsService?
    private var connectivity:IConnectivityService?
    private var product_id:Int?
    
    /*
     * Method name: init
     * Description: use to init interactor with respective dependancy
     * Parameters: IProductDetailsViewPresenter, IProductService, IConnectivityService, Product
     * Return:  -
     */
    init(presenter:IProductDetailsViewPresenter?, productService: IProductDetailsService?,
         connectivity:IConnectivityService?, product_id:Int) {
        self.presenter = presenter
        self.productService = productService
        self.connectivity = connectivity
        self.product_id = product_id
    }
    /*
     * Method name: initSetup
     * Description: use to setup things, calling api
     * Parameters:
     * Return:  -
     */
    // MARK: - API methods
    func initSetup() {
        guard let productId = product_id else {
            self.presenter?.interactor(didFailedRetrieveProducts: ErrorMessages.ProductDetails.error)
            return
        }
        guard connectivity?.networkConnected == true  else {
            presenter?.interactor(internetConnectionRequired: ErrorMessages.Network.noNetwork)
            return
        }
        productService?.getProductDetails(param: ["product_id": productId], completionHandler: { response in
            var message = ""
            switch response {
            case .success(value: let response) :
                if  let responseVal = response.data {
                    self.presenter?.interactor(didRetrieveProducts: responseVal)
                    return
                } else {
                    message = ErrorMessages.ProductDetails.noData
                }
            default:
                message = ErrorMessages.ProductDetails.error
            }
            self.presenter?.interactor(didFailedRetrieveProducts: message)
        })
        
    }
}
