//
//  ProductListViewInteractor.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import Foundation

class ProductListViewInteractor: IProductListViewInteractor {
    
    private var presenter: IProductListViewPresenter?
    private var productService: IProductService?
    private var connectivity:IConnectivityService?
    private var favouriteService:IFavouriteService?
    
    private var products: [Product] = []
    
    private var favouriteProduct = [FavouriteProduct]()
    
    
    /*
     * Method name: init
     * Description: use to init interactor with respective dependancy
     * Parameters: IProductListViewPresenter, IProductService, IConnectivityService, IFavoriteService
     * Return:  -
     */
    init(presenter:IProductListViewPresenter?, productService: IProductService?,
         connectivity:IConnectivityService?, favouriteService: IFavouriteService?) {
        self.presenter = presenter
        self.productService = productService
        self.connectivity = connectivity
        self.favouriteService = favouriteService
    }
    
    /*
     * Method name: initSetup
     * Description: use to setup things
     * Parameters:
     * Return:  -
     */
    func initSetup() {
        getFavouriteProduct()
        loadDataFromAPI()
    }
}

// MARK: - API methods
extension ProductListViewInteractor {
    /*
     * Method name: loadDataFromAPI
     * Description: use to get data from api
     * Parameters:
     * Return:  -
     */
    private func loadDataFromAPI() {
        guard connectivity?.networkConnected == true  else {
            presenter?.interactor(internetConnectionRequired: ErrorMessages.Network.noNetwork)
            return
        }
        products.removeAll()
        productService?.getProductListing(param: ["product_category_id": 1], completionHandler: { response in
            var message = ""
            switch response {
            case .success(value: let response) :
                if  let responseVal = response.data {
                    self.products = responseVal
                    self.presenter?.interactor(didRetrieveProducts: self.products)
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
// MARK: - Favorites methods
extension ProductListViewInteractor {
    /*
     * Method name: getFavouriteProduct
     * Description: use to setup things
     * Parameters:
     * Return:  -
     */
    func getFavouriteProduct() {
        favouriteService?.getFavouriteProducts { response in
            self.favouriteProduct = response
            self.presenter?.interactor(didRetriveFavouriteProducts: self.favouriteProduct)
        }
    }
    
    /*
     * Method name: addFavouriteProduct
     * Description: use to add product to fav
     * Parameters: product id
     * Return:  -
     */
    func addFavouriteProduct(productId:Int) {
        favouriteService?.addFavouriteProduct(productId: productId, completionHandler: { response in
            if let product = response {
                self.favouriteProduct.append(product)
                self.presenter?.interactor(didAddFavouriteProducts: product )
            } else {
                self.presenter?.interactor(didFailToRemoveFavouriteProduct: ErrorMessages.ProductDetails.favAddError)
            }
        })
    }
    
    /*
     * Method name: removeFavouriteProduct
     * Description: use to remove product from Favorites
     * Parameters: product
     * Return:  -
     */
    func removeFavouriteProduct(product:FavouriteProduct, index:Int) {
        let response = favouriteService?.deleteProduct(product: product)
        switch response {
        case .success:
            self.favouriteProduct.remove(at: index)
            presenter?.interactor(didRemoveFavouriteProducts: index)
        default:
            presenter?.interactor(didFailToRemoveFavouriteProduct: ErrorMessages.ProductDetails.favRemoveError)
        }
    }
}
