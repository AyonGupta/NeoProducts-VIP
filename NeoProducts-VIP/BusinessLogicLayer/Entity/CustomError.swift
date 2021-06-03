//
//  CustomError.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import Foundation
protocol IErrorProtocol : LocalizedError{
    var title : String? {get}
    var code : Int {get}
}
struct CustomError : IErrorProtocol {
    var title: String?
    var code: Int
    var errorDescription: String? { return _description }
    var failureReason: String? { return _description }
    
    private var _description: String
    
    /**
     * Method name: init
     * Description: This function is used to bind all property received from source
     * Parameters: title, description, code
     */
    init(title: String?, description: String, code: Int) {
        self.title = title ?? "Error"
        self._description = description
        self.code = code
    }
}
