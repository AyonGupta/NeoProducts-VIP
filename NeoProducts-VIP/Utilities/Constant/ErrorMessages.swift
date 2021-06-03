//
//  ErrorMessages.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import Foundation
struct ErrorMessages {
    
    struct Network {
        static let noNetwork = "Please check your internet connection and try again"
    }
    
    struct ProductDetails {
        static let noData = "Sorry No Products found"
        static let error = "Error occured while loading product information"
        static let favAddError = "Error occured while Favoriting the product"
        static let favRemoveError = "Error occured while removing product from favorite list"
    }
}
