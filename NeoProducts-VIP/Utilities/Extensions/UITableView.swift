 
//import Foundation
import UIKit

public extension UITableView {
  
    /*
     * Method name: registerCellNib
     * Description: use to register cell
     * Parameters: identifier of the cell
     * Return:  -
     */
    func registerCellNib(_ identifier: String ) {
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
    /*
     * Method name: registerHeaderFooterViewNib
     * Description: use to register footer view
     * Parameters: identifier of the view
     * Return:  -
     */
    func registerHeaderFooterViewNib(_  identifier: String ) {
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
    /*
     * Method name: registerCellNib
     * Description: use to register of the cell
     * Parameters: nibName of the cell, identifier of the cell
     * Return:  -
     */
    func registerCellNib(_ nibName: String, identifier: String ) {
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
    
    /*
    * Method name: registerHeaderFooterViewNib
    * Description: use to register footer view
    * Parameters: nibName of the view, identifier of the view
    * Return:  -
    */
    func registerHeaderFooterViewNib(_ nibName: String, identifier: String ) {
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
    /*
     * Method name: addDummyFooterView
     * Description: use to add footer view
     * Parameters: height,color
     * Return:  -
     */
    func addDummyFooterView(_ height: CGFloat = 100, color: UIColor = UIColor.white) {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.height, height: height))
        footerView.backgroundColor = UIColor.clear
        self.tableFooterView = footerView
    }
}
