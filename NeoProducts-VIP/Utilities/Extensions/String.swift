 
 import Foundation
 import UIKit
 extension String {
    
    /*
     * Method name: className
     * Description: use to get class name
     * Parameters: aClass object
     * Return:  -
     */
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    /*
      use to get length of the string
     */
    var length: Int {
        return self.count
    }

   
    /*
     use to remove whitespaces And Newlines from string
     */
    public var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
     
 }
