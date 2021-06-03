//
//  Protocols.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 03/06/21.
//

import Foundation

//View controller Protocol methods
protocol IProductListPresenterOutput: AnyObject {
    func presenter(didRetrieveProducts products: [Product])
    func presenter(didFailedRetrieveProducts error: String)
    func presenter(internetConnectionRequired error: String)
    
    func presenter(didRetriveFavouriteProducts products: [FavouriteProduct])
    
    func presenter(didAddFavouriteProducts product: FavouriteProduct)
    func presenter(didFailToAddFavouriteProduct error:String)
    
    func presenter(didRemoveFavouriteProducts index: Int)
    func presenter(didFailToRemoveFavouriteProduct error:String)
}

//View controller View Protocol methods
protocol IProductListViewOutput: AnyObject {
    func addProductToFavorites(productId:Int)
    func removeProductFromFavorites(product:FavouriteProduct, index:Int)
    func didSelectRowAtIndexPath(product_id:Int, indexPath:IndexPath)
}

// Interactor Protocol methods
protocol IProductListViewInteractor: AnyObject {
    func initSetup()
    func addFavouriteProduct(productId:Int)
    func removeFavouriteProduct(product:FavouriteProduct, index:Int)
}

// Presenter Protocol methods
protocol IProductListViewPresenter: AnyObject {
    func interactor(didRetrieveProducts products: [Product])
    func interactor(didFailedRetrieveProducts error: String)
    func interactor(internetConnectionRequired error: String)
    
    func interactor(didRetriveFavouriteProducts products: [FavouriteProduct])
    
    func interactor(didAddFavouriteProducts product: FavouriteProduct)
    func interactor(didFailToAddFavouriteProduct error:String)
    
    func interactor(didRemoveFavouriteProducts index: Int)
    func interactor(didFailToRemoveFavouriteProduct error:String)
    
}
