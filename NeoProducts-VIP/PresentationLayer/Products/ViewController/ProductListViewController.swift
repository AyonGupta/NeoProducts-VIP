//
//  ProductListViewController.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import UIKit

class ProductListViewController: UIViewController {
    
    // MARK: - Properties
    var listView: ProductListView?
    var interactor: IProductListViewInteractor?
    var router: IProductListViewRouter?
  
    // MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        self.view = listView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = StringConstant.Products.title
        interactor?.initSetup()
    }
}

// MARK: - ListView Output
extension ProductListViewController: IProductListViewOutput {
    /*
     * Method name: presenter addProductToFavorites
     * Description: This function use to add product to fav
     * Parameters: products
     * Return:  -
     */
    func addProductToFavorites(productId:Int) {
        interactor?.addFavouriteProduct(productId: productId)
    }
    /*
     * Method name: presenter removeProductFromFavorites
     * Description: This function use to remove product from fav
     * Parameters: products
     * Return:  -
     */
    func removeProductFromFavorites(product:FavouriteProduct, index:Int) {
        interactor?.removeFavouriteProduct(product: product, index: index)
    }
    /*
     * Method name: presenter didSelectRowAtIndexPath
     * Description: This function use to do navigation things
     * Parameters: products
     * Return:  -
     */
    func didSelectRowAtIndexPath(product_id:Int, indexPath:IndexPath) {
        router?.routeToDetail(with: product_id)
    }
}
// MARK: - Presenter Output
extension ProductListViewController: IProductListPresenterOutput {
    
    /*
     * Method name: presenter didRetrieveProducts
     * Description: This function use to nofity once product downloaded, class calling relaod tableView function
     * Parameters: products
     * Return:  -
     */
    func presenter(didRetrieveProducts products: [Product]) {
        listView?.controller(didRetrieveProducts: products)
    }
    
    /*
     * Method name: presenter internetConnectionRequired
     * Description: use to show alert if network not found
     * Parameters: error
     * Return:  -
     */
    func presenter(internetConnectionRequired error: String) {
        showError(with: error)
    }
    
    /*
     * Method name: presenter didFailedRetrieveProducts
     * Description: use to call updatePlaceholderText function if error found
     * Parameters: error
     * Return:  -
     */
    func presenter(didFailedRetrieveProducts error: String) {
        listView?.controller(didFailedRetrieveProducts: error)
    }
    
    /*
     * Method name: presenter didRetriveFavouriteProducts
     * Description: use to call presenter function when Favorites found
     * Parameters: error
     * Return:  -
     */
    func presenter(didRetriveFavouriteProducts products: [FavouriteProduct]) {
        listView?.controller(didRetriveFavouriteProducts: products)
    }
    
    /*
     * Method name: presenter didAddFavouriteProducts
     * Description: use to call when product added to Favorites
     * Parameters: error
     * Return:  -
     */
    func presenter(didAddFavouriteProducts product: FavouriteProduct) {
        listView?.controller(didAddFavouriteProducts: product)
    }
    
    /*
     * Method name: presenter didFailToAddFavouriteProduct
     * Description: use to call when product error occured while adding to Favorites
     * Parameters: error
     * Return:  -
     */
    func presenter(didFailToAddFavouriteProduct error:String) {
        showError(with: error)
    }
    
    /*
     * Method name: presenter didRemoveFavouriteProducts
     * Description: use to call when product removed from Favorites
     * Parameters: error
     * Return:  -
     */
    func presenter(didRemoveFavouriteProducts index: Int) {
        listView?.controller(didRemoveFavouriteProducts: index)
    }
    
    /*
     * Method name: presenter didFailToRemoveFavouriteProduct
     * Description: use to call when error occured while removing from Favorites
     * Parameters: error
     * Return:  -
     */
    func presenter(didFailToRemoveFavouriteProduct error:String) {
        showError(with: error)
    }
}
