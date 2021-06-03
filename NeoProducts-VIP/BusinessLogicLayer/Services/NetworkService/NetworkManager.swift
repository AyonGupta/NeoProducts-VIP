//
//  NetworkManager.swift
// NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import Foundation
import Alamofire

protocol INetworkManager {
    func performRequest<T: Codable>(serviceType:NetworkAPI, completionHandler: @escaping(ApiResponse<T>)->())
}


final class NetworkManager:INetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    private let manager: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = nil
        configuration.timeoutIntervalForRequest = TimeInterval(60)
        configuration.timeoutIntervalForResource = TimeInterval(60)
        return Session(
            configuration: configuration)
    }()
    /*
     * Method name: performRequest
     * Description: use call api
     * Parameters: NetworkAPI and completion handler
     * Return:  -
     */
    internal func performRequest<T: Codable>(serviceType:NetworkAPI, completionHandler: @escaping(ApiResponse<T>)->()) {
        
        manager.request(serviceType.path,
                        method: serviceType.method,
                        parameters: serviceType.parameters,
                        encoding: serviceType.encoding,
                        headers: serviceType.headers).responseData { (response) in
                            switch response.result {
                            case .success(let value):
                                do {
                                    let model: T = try JSONDecoder().decode(T.self, from: value )
                                    completionHandler(.success(value: model))
                                } catch let error {
                                    completionHandler(.failure(error: error))
                                }
                            case .failure(let error):
                                print(error.localizedDescription)
                                completionHandler(.failure(error: error))
                            }
                        }
        
    }
}
