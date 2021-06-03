//
//  UIView.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import Foundation
import UIKit

extension UIView {
        
    func addConstraints(addToView:UIView)  {
        self.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11, *) {
            let guide = addToView.safeAreaLayoutGuide
            self.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
            self.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        } else {
            self.leadingAnchor.constraint(equalTo: addToView.leadingAnchor).isActive = true
            self.trailingAnchor.constraint(equalTo: addToView.trailingAnchor).isActive = true
        }
        
        self.topAnchor.constraint(equalTo: addToView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: addToView.bottomAnchor).isActive = true
    }
    
    func addConstraintsWithHeight(addToView:UIView,height:CGFloat)  {
        self.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11, *) {
            let guide = addToView.safeAreaLayoutGuide
            self.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
            self.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        } else {
            self.leadingAnchor.constraint(equalTo: addToView.leadingAnchor).isActive = true
            self.trailingAnchor.constraint(equalTo: addToView.trailingAnchor).isActive = true
        }
        self.topAnchor.constraint(equalTo: addToView.topAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    
    
    func addConstraintsWithHeightWithBottom(addToView:UIView,height:CGFloat)  {
        self.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11, *) {
            let guide = addToView.safeAreaLayoutGuide
            self.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
            self.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        } else {
            self.leadingAnchor.constraint(equalTo: addToView.leadingAnchor).isActive = true
            self.trailingAnchor.constraint(equalTo: addToView.trailingAnchor).isActive = true
        }
        self.bottomAnchor.constraint(equalTo: addToView.bottomAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
}
