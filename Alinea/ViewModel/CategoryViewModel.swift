//
//  CategoryViewModel.swift
//  Alinea
//
//  Created by Rajagopal Ganesan on 12/11/20.
//

import UIKit

protocol CategoryVMDelegate: class {
    func reloadCategoryData()
}

class CategoryViewModel: NSObject {

    weak var delegate: CategoryVMDelegate?
    
    public func loadDataSource() {
        //If any data to fetch from server or setting up the dataSource & reloading the tableview
        if let delegate_ = delegate {
            delegate_.reloadCategoryData()
        }
    }
}
