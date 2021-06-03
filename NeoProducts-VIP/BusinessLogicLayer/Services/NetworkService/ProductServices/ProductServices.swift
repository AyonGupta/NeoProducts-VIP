//
//  ProductServices.swift
// NeoProducts-VIP

//
//  Created by webwerks on 02/06/21.

//

import Foundation

protocol IProductService {
    func getProductListing(param:AnyDict,
                           completionHandler: @escaping(ApiResponse<ApiResponseModel<[Product]>>)->())

}
protocol IProductDetailsService {
    func getProductDetails(param:AnyDict,
                           completionHandler: @escaping(ApiResponse<ApiResponseModel<ProductDetails>>)->())
    
}

import Foundation

struct ProductService: IProductService, IProductDetailsService {
    
    private var networkManager:INetworkManager?
    /*
     * Method name: init
     * Description: use init product service
     * Parameters: networkManager
     * Return:  -
     */
    init(networkManager:INetworkManager?) {
        self.networkManager = networkManager
    }
    
    /*
     * Method name: getProductListing
     * Description: use get product data from server
     * Parameters: param and completion handler
     * Return:  -
     */
    internal func getProductListing(param:AnyDict, completionHandler: @escaping(ApiResponse<ApiResponseModel<[Product]>>)->()) {
        networkManager?.performRequest(serviceType: .getProduct(param: param), completionHandler: completionHandler)
    }
    
    /*
     * Method name: getProductListing
     * Description: use get product data from server
     * Parameters: param and completion handler
     * Return:  -
     */
    internal func getProductDetails(param:AnyDict, completionHandler: @escaping(ApiResponse<ApiResponseModel<ProductDetails>>)->()) {
        networkManager?.performRequest(serviceType: .getProductDetails(param: param), completionHandler: completionHandler)
    }
}
