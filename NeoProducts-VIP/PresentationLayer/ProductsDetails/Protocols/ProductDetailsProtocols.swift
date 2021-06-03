//
//  Protocols.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 03/06/21.
//

import Foundation

//View controller Protocol methods
protocol IProductDetailsPresenterOutput: AnyObject {
    func presenter(didRetrieveProducts productsDetails: ProductDetails)
    func presenter(didFailedRetrieveProducts error: String)
    func presenter(internetConnectionRequired error: String)
}

// Presenter Protocol methods
protocol IProductDetailsViewPresenter: AnyObject {
    func interactor(didRetrieveProducts productsDetails: ProductDetails)
    func interactor(internetConnectionRequired error: String)
    func interactor(didFailedRetrieveProducts error: String)
    
}

// Interactor Protocol methods
protocol IProductDetailsViewInteractor: AnyObject {
    func initSetup()
}
