//
//  ProductListViewPresenter.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import Foundation


class ProductListViewPresenter: IProductListViewPresenter {
    weak var viewController: IProductListPresenterOutput?
    
    /*
     * Method name: interactor didRetrieveProducts
     * Description: use to call presenter function once products found
     * Parameters: products
     * Return:  -
     */
    func interactor(didRetrieveProducts products: [Product]) {
        viewController?.presenter(didRetrieveProducts: products)
    }
    
    /*
     * Method name: interactor internetConnectionRequired
     * Description: use to call presenter function if not network found
     * Parameters: error
     * Return:  -
     */
    func interactor(internetConnectionRequired error: String) {
        viewController?.presenter(internetConnectionRequired: error)
    }
    
    /*
     * Method name: interactor didFailedRetrieveProducts
     * Description: use to call presenter function if error found
     * Parameters: error
     * Return:  -
     */
    func interactor(didFailedRetrieveProducts error: String) {
        viewController?.presenter(didFailedRetrieveProducts: error)
    }
    
    /*
     * Method name: interactor didRetriveFavouriteProducts
     * Description: use to call presenter function when Favorites found
     * Parameters: error
     * Return:  -
     */
    func interactor(didRetriveFavouriteProducts products: [FavouriteProduct]) {
        viewController?.presenter(didRetriveFavouriteProducts: products)
    }
    
    /*
     * Method name: interactor didAddFavouriteProducts
     * Description: use to call when product added to Favorites
     * Parameters: error
     * Return:  -
     */
    func interactor(didAddFavouriteProducts product: FavouriteProduct) {
        viewController?.presenter(didAddFavouriteProducts: product)
    }
    
    /*
     * Method name: interactor didFailToAddFavouriteProduct
     * Description: use to call when product error occured while adding to Favorites
     * Parameters: error
     * Return:  -
     */
    func interactor(didFailToAddFavouriteProduct error:String) {
        viewController?.presenter(didFailToAddFavouriteProduct: error)
    }
    
    /*
     * Method name: interactor didRemoveFavouriteProducts
     * Description: use to call when product removed from Favorites
     * Parameters: error
     * Return:  -
     */
    func interactor(didRemoveFavouriteProducts index: Int) {
        viewController?.presenter(didRemoveFavouriteProducts: index)
    }
    
    /*
     * Method name: interactor didFailToRemoveFavouriteProduct
     * Description: use to call when error occured while removing from Favorites
     * Parameters: error
     * Return:  -
     */
    func interactor(didFailToRemoveFavouriteProduct error:String) {
        viewController?.presenter(didFailToRemoveFavouriteProduct: error)
    }
}

