//
//  NetworkService.swift
// NeoProducts-VIP

//
//  Created by webwerks on 02/06/21.

//

import Foundation
import Alamofire

enum NetworkAPI {
    
    enum NetworkEnvironment: String {
        case Development
        case Production
        case QA
    }
    
    /*
     use to get network Environment
     */
    var networkEnvironment: NetworkEnvironment {
        return .Development
    }
    
    /*
     use to get base of the service
     */
    var BaseURL: String {
        switch networkEnvironment {
        case .QA:
            return ""
        case .Production:
            return ""
        default:
            return "http://staging.php-dev.in:8844/trainingapp/api/"
        }
    }
    
    case getProduct(param:AnyDict)
    case getProductDetails(param:AnyDict)
}

extension NetworkAPI {
    /*
     use to get path of the service
     */
    var path: String  {
        var servicePath = ""
        switch self {
        case .getProduct:
            servicePath = "products/getList"
        case .getProductDetails:
            servicePath = "products/getDetail"
        }
        return BaseURL + servicePath
    }
    /*
     use to get headers of the service
     */
    var headers: HTTPHeaders? {
        var headersDict = HTTPHeaders()
        headersDict["accept"] = "application/json"
        return headersDict
    }
    
    /*
     use to get parammeter of the service
     */
    var parameters:AnyDict? {
        var allParam : AnyDict = [ : ]
        switch self {
        case .getProduct(let param),
             .getProductDetails(let param):
            allParam = param
        }
        return allParam
    }
    
    /*
     use to get method of the service
     */
    var method:HTTPMethod {
        switch self {
        case .getProduct,
             .getProductDetails:
            return .get
        default:
            return .post
        }
    }
    /*
     use to get encoding of the service
     */
    var encoding:ParameterEncoding {
        switch self {
        case .getProduct,
             .getProductDetails:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
}

