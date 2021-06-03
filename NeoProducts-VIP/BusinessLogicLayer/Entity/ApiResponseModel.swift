//
//  ApiResponseModel.swift
// NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.

//

import Foundation
struct ApiResponseModel<T : Codable>: Codable {
    var statusCode: Int?
    var message: String?
    var user_msg: String?
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case statusCode = "status"
        case data = "data"
        case user_msg = "user_msg"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = container.decodeSafelyIfPresent(.message)
        self.data = container.decodeSafelyIfPresent(.data)
        self.statusCode = container.decodeSafelyIfPresent(.statusCode)
        self.user_msg = container.decodeSafelyIfPresent(.user_msg)
    }
}
