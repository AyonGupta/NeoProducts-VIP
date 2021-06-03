//
//  ProductDetails.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import Foundation

struct ProductDetailsResponse : Codable {
    
    let data : ProductDetails?
    let status : Int?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data  = container.decodeSafelyIfPresent(.data)
        self.status  = container.decodeSafelyIfPresent(.status)
    }
    
}

struct ProductDetails : Codable {
    
    let cost : Int?
    let created : String?
    let descriptionField : String?
    let id : Int?
    let modified : String?
    let name : String?
    let producer : String?
    let productCategoryId : Int?
    let productImages : [ProductImage]?
    let rating : Int?
    let viewCount : Int?
    
    enum CodingKeys: String, CodingKey {
        case cost = "cost"
        case created = "created"
        case descriptionField = "description"
        case id = "id"
        case modified = "modified"
        case name = "name"
        case producer = "producer"
        case productCategoryId = "product_category_id"
        case productImages = "product_images"
        case rating = "rating"
        case viewCount = "view_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        cost =   container.decodeSafelyIfPresent(.cost)
        created =   container.decodeSafelyIfPresent(.created)
        descriptionField =   container.decodeSafelyIfPresent(.descriptionField)
        id =   container.decodeSafelyIfPresent(.id)
        modified =   container.decodeSafelyIfPresent(.modified)
        name =   container.decodeSafelyIfPresent(.name)
        producer =   container.decodeSafelyIfPresent(.producer)
        productCategoryId =   container.decodeSafelyIfPresent(.productCategoryId)
        productImages =   container.decodeSafelyIfPresent(.productImages)
        rating =   container.decodeSafelyIfPresent(.rating)
        viewCount =   container.decodeSafelyIfPresent(.viewCount)
    }
    
}

struct ProductImage : Codable {
    
    let created : String?
    let id : Int?
    let image : String?
    let modified : String?
    let productId : Int?
    
    enum CodingKeys: String, CodingKey {
        case created = "created"
        case id = "id"
        case image = "image"
        case modified = "modified"
        case productId = "product_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        created = container.decodeSafelyIfPresent(.created)
        id = container.decodeSafelyIfPresent(.id)
        image = container.decodeSafelyIfPresent(.image)
        modified = container.decodeSafelyIfPresent(.modified)
        productId = container.decodeSafelyIfPresent(.productId)
    }
    
}
