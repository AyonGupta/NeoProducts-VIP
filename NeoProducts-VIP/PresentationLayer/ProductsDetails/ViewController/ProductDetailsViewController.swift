//
//  ProductDetailsViewController.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    // MARK: - Properties
    var detailsView: ProductDetailsView?
    var interactor: IProductDetailsViewInteractor?
    var router: IProductDetailsViewRouter?
    
    // MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        self.view = detailsView
    }
    /*
     * Method name: presenter viewDidLoad
     * Description: use to call when view is loaded
     * Parameters: -
     * Return:  -
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = StringConstant.ProductsDetails.title
        interactor?.initSetup()
    }
}

// MARK: - Presenter Output
extension ProductDetailsViewController: IProductDetailsPresenterOutput {
    /*
     * Method name: presenter didRetrieveProductDetaails
     * Description: use to call presenter function once product data found
     * Parameters: productsDetails
     * Return:  -
     */
    func presenter(didRetrieveProducts productsDetails: ProductDetails) {
        self.detailsView?.didRetrieveProducts(productsDetails: productsDetails)
    }
    
    /*
     * Method name: presenter internetConnectionRequired
     * Description: use to show alert if network not found
     * Parameters: error
     * Return:  -
     */
    func presenter(internetConnectionRequired error: String) {
        self.detailsView?.didFailedRetrieveProducts(error: error)
    }
    
    /*
     * Method name: presenter didFailedRetrieveProducts
     * Description: use to call updatePlaceholderText function if error found
     * Parameters: error
     * Return:  -
     */
    func presenter(didFailedRetrieveProducts error: String) {
        self.detailsView?.didFailedRetrieveProducts(error: error)
    }
}
