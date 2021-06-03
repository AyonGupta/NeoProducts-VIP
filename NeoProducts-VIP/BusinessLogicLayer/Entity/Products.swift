//
//  Products.swift
// NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.

//

import Foundation
struct Product : Codable {
    
    var product_id : Int?
    var product_category_id : Int?
    var product_name : String?
    var product_producer : String?
    var product_description : String?
    var product_cost : Int?
    var product_rating : Int?
    var product_view_count : Int?
    var product_Image : String?

    enum CodingKeys: String, CodingKey {
        case product_id = "id"
        case product_category_id = "product_category_id"
        case product_name = "name"
        case product_producer = "producer"
        case product_description = "description"
        case product_cost = "cost"
        case product_rating = "rating"
        case product_view_count = "view_count"
        case product_Image = "product_images"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.product_id  = container.decodeSafelyIfPresent(.product_id)
        self.product_name  = container.decodeSafelyIfPresent(.product_name)
        self.product_description  = container.decodeSafelyIfPresent(.product_description)
        self.product_producer  = container.decodeSafelyIfPresent(.product_producer)
        self.product_cost  = container.decodeSafelyIfPresent(.product_cost)
        self.product_rating  = container.decodeSafelyIfPresent(.product_rating)
        self.product_view_count  = container.decodeSafelyIfPresent(.product_view_count)
        self.product_Image  = container.decodeSafelyIfPresent(.product_Image)
        self.product_category_id  = container.decodeSafelyIfPresent(.product_category_id)
    }
}

  
