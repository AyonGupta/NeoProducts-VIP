//
//  ProductDetailsView.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import UIKit
class ProductDetailsView: BaseListView {
    private var productsDetails: ProductDetails?
    private var tableHeaderView = ImageGalleryView.loadView()
    
    override func setupTableView() {
        tableView.registerCellNib(ScreenIndetifires.CustomCell.productDetailsViewCell)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 115
        tableView.addDummyFooterView()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func refreshData(){
        let width = UIScreen.main.bounds.size.width
        let height: CGFloat =  9 * width / 16
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        tableHeaderView?.frame = rect
        tableView.tableHeaderView = tableHeaderView
        let urls =  productsDetails?.productImages?.map({$0.image}).compactMap({$0}) ?? [String]()
        tableHeaderView?.addImageView(scrollImageArray: urls)
        self.reloadTableView()
    }
    
    func didRetrieveProducts(productsDetails: ProductDetails?){
        self.productsDetails = productsDetails
        productsDetails == nil ? showPlaceholder() : hidePlaceholder()
        refreshData()
    }
    
    func didFailedRetrieveProducts(error: String) {
        updatePlaceholderText(text: error)
        showPlaceholder()
    }
}
// MARK: - UITableView DataSource
extension ProductDetailsView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return productsDetails != nil ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: ScreenIndetifires.CustomCell.productDetailsViewCell) as? ProductDetailsViewCell
        cell?.setProductData(product: productsDetails)
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableView Delegate
extension ProductDetailsView: UITableViewDelegate {
    
}

