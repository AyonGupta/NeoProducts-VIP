//
//  UINavigationBar.swift
// NeoProducts-VIP

//
//  Created by webwerks on 02/06/21.

//

import Foundation
import UIKit
extension UINavigationBar {
    
    func transparentNavigationBar() {
        self.isTranslucent = false
        let apperance =  UINavigationBar.appearance()
        apperance.barTintColor = Theme.Colors.redColor
        apperance.setBackgroundImage(UIImage(), for: .default)
        let attributes = [NSAttributedString.Key.font: Theme.Font.boldHeadline, NSAttributedString.Key.foregroundColor : Theme.Colors.whiteColor]
        apperance.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
        apperance.tintColor = Theme.Colors.whiteColor
     }
}
