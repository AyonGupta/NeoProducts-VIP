//
//  BaseListView.swift
//  NeoProducts-VIP
//
//  Created by webwerks on 02/06/21.
//

import Foundation
import UIKit
class BaseListView: UIView {
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    /*
     * Method name: showPlaceholder
     * Description: use to hide tableView and show label
     * Parameters: -
     * Return:  -
     */
    public func showPlaceholder() {
        UIView.animate(withDuration: 0.3) {
            self.placeholderLabel.alpha = 1.0
            self.tableView.alpha = 0.0
        }
    }
    
    /*
     * Method name: hidePlaceholder
     * Description: use to show tableView and hide label
     * Parameters: -
     * Return:  -
     */
    public func hidePlaceholder() {
        UIView.animate(withDuration: 0.3) {
            self.placeholderLabel.alpha = 0.0
            self.tableView.alpha = 1.0
        }
    }
    
    /*
     * Method name: reloadTableView
     * Description: use to reload tableview
     * Parameters: -
     * Return:  -
     */
    public func reloadTableView() {
        self.tableView.reloadData()
    }
    
    
    //use get initialize tableview
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    /*
     * Method name: setupTableView
     * Description: use to setup tableview
     * Parameters: -
     * Return:  -
     */
    public func setupTableView() {
        tableView.registerCellNib(ScreenIndetifires.CustomCell.productCell)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 115
        tableView.addDummyFooterView()
    }
    
    //use get initialize label
    lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.font = Theme.Font.mediumTitle1
        label.text = ""
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /*
     * Method name: updatePlaceholderText
     * Description: use to update placeholder text
     * Parameters: text as String
     * Return:  -
     */
    func updatePlaceholderText(text:String) {
        placeholderLabel.text = text
    }
}

// MARK: - UI Setup
extension BaseListView {
    /*
     * Method name: setupUI
     * Description: use to setup UI Of the view
     * Parameters:
     * Return:  -
     */
    private func setupUI() {
       
        self.backgroundColor = .white
        self.addSubview(tableView)
        self.addSubview(placeholderLabel)
        
        setupTableView()
        
        tableView.addConstraints(addToView: self)
        placeholderLabel.addConstraints(addToView: self)
    }
}
