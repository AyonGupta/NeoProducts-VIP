//
//  ProductListView.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import UIKit
class ProductListView: BaseListView {
    weak var viewController: IProductListViewOutput?
    private var products: [Product] = []
    private var favouriteProducts = [FavouriteProduct]()
    override func setupTableView() {
        tableView.registerCellNib(ScreenIndetifires.CustomCell.productCell)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 115
        tableView.addDummyFooterView()
        tableView.delegate = self
        tableView.dataSource = self
    }
    /*
     * Method name: favButtonClick
     * Description: This function use to add or remove product from favorites list
     * Parameters: productId
     * Return:  -
     */
    @objc private func favButtonClick(button:UIButton) {
        let buttonPostion = button.convert(button.bounds.origin, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: buttonPostion) {
            let product = self.products[indexPath.row]
            if let productId = product.product_id {
                let favArray = favouriteProducts.filter({$0.product_id == productId})
                if  favArray.count == 0{
                    viewController?.addProductToFavorites(productId: productId)
                } else {
                    if let firstObject = favArray.first,  let index  = favouriteProducts.firstIndex(of: firstObject) {
                        viewController?.removeProductFromFavorites(product: firstObject, index: index)
                    }
                }
            }
        }
    }
    /*
     * Method name: productIsFav
     * Description: This function use verify product is favorites or not
     * Parameters: productId
     * Return:  -
     */
    private func productIsFav(productId:Int) ->Bool{
        let fav = favouriteProducts.filter({$0.product_id == productId})
        return fav.count > 0
    }
}
// MARK: - ListView input methods
extension ProductListView {
    /*
     * Method name: controller didRetrieveProducts
     * Description: This function use to nofity once product downloaded, class calling relaod tableView function
     * Parameters: products
     * Return:  -
     */
    func controller(didRetrieveProducts products: [Product]) {
        self.products = products
        reloadTableView()
    }
    
    /*
     * Method name: controller didFailedRetrieveProducts
     * Description: use to call updatePlaceholderText function if error found
     * Parameters: error
     * Return:  -
     */
    func controller(didFailedRetrieveProducts error: String) {
        updatePlaceholderText(text: error)
    }
    
    /*
     * Method name: presenter didRetriveFavouriteProducts
     * Description: use to call presenter function when Favorites found
     * Parameters: error
     * Return:  -
     */
    func controller(didRetriveFavouriteProducts products: [FavouriteProduct]) {
        favouriteProducts = products
        reloadTableView()
    }
    
    /*
     * Method name: presenter didAddFavouriteProducts
     * Description: use to call when product added to Favorites
     * Parameters: error
     * Return:  -
     */
    func controller(didAddFavouriteProducts product: FavouriteProduct) {
        self.favouriteProducts.append(product)
        reloadTableView()
    }
    
    /*
     * Method name: controller didRemoveFavouriteProducts
     * Description: use to call when product removed from Favorites
     * Parameters: error
     * Return:  -
     */
    func controller(didRemoveFavouriteProducts index: Int) {
        self.favouriteProducts.remove(at: index)
        reloadTableView()
    }
}

// MARK: - UITableView DataSource
extension ProductListView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        self.products.isEmpty ? showPlaceholder() : hidePlaceholder()
        return self.products.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: ScreenIndetifires.CustomCell.productCell) as? ProductListViewCell
        let product = self.products[indexPath.row]
        cell?.setProductData(product: product)
        cell?.productFavButton.addTarget(self, action: #selector(favButtonClick(button:)), for: .touchUpInside)
        cell?.setFavoriteImage(isFav: productIsFav(productId: product.product_id ?? 0))
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableView Delegate
extension ProductListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = self.products[indexPath.row]
        if let product_id = product.product_id {
            viewController?.didSelectRowAtIndexPath(product_id: product_id, indexPath: indexPath)
        }
    }
}
