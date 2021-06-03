//
//  ProductDetailsViewRouter.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import Foundation
import UIKit

protocol  IProductDetailsViewRouter: AnyObject {
    var navigationController: UINavigationController? { get }
 }

class ProductDetailsViewRouter: IProductDetailsViewRouter {
    weak var navigationController: UINavigationController?
}
