//
//  FavoriteService.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import Foundation
import CoreData
protocol IFavouriteService {
    func addFavouriteProduct(productId:Int, completionHandler : @escaping (FavouriteProduct?) -> Void)
    func getFavouriteProducts(completionHandler : @escaping ([FavouriteProduct]) -> Void)
    func deleteProduct(product:FavouriteProduct)->Result<Bool,CustomError>
}

class FavouriteService: BaseCoreDataService, IFavouriteService {
    
    /*
     * Method name: addFavouriteProduct
     * Description: use to save data in Core data
     * Parameters: productId and completion handler
     * Return:  -
     */
    func addFavouriteProduct(productId:Int, completionHandler : @escaping (FavouriteProduct?) -> Void) {
        if let entity = NSEntityDescription.entity(forEntityName: "FavouriteProduct",
                                                   in: managedContext) {
            let favObj = FavouriteProduct (entity: entity,
                                     insertInto: managedContext)
            favObj.product_id  = Int64 (productId )
            let response = saveContext()
            switch response {
            case .success:
                completionHandler(favObj)
            default:
                completionHandler(nil)
            }
        } else {
            completionHandler(nil)
        }
     }
    
    /*
     * Method name: getFavouriteProducts
     * Description: use to get data from Core data
     * Parameters: completion handler
     * Return:  -
     */
    func getFavouriteProducts(completionHandler : @escaping ([FavouriteProduct]) -> Void) {
        fetchData(entity: FavouriteProduct.self, format: nil, completionHandler: completionHandler)
    }
    
    /*
     * Method name: deleteProduct
     * Description: use to delete data from Core data
     * Parameters: completion handler
     * Return:  -
     */
    func deleteProduct(product:FavouriteProduct)->Result<Bool,CustomError> {
         managedContext.delete(product)
         return saveContext()
    }
    
}
