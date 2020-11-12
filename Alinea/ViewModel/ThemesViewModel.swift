//
//  ThemesViewModel.swift
//  Alinea
//
//  Created by Rajagopal Ganesan on 12/11/20.
//

import UIKit

protocol ThemesVMDelegate: class {
    func reloadThemesData()
}

class ThemesViewModel: NSObject {
    
    weak var delegate: ThemesVMDelegate?
    lazy var model = [ThemesModel]()
    
    public func loadDataSource() {
        //If any data to fetch from server or setting up the dataSource & reloading the tableview
        self.getThemesData()
    }
    
    private func getThemesData() {
        
        for i in 0..<10 {
            
            let currentModel = ThemesModel()
            currentModel.themeName = ThemesConstant[i]
            currentModel.image = ImagesConstants[i]
            self.model.append(currentModel)
        }
        
        if let delegate_ = delegate {
            delegate_.reloadThemesData()
        }
    }
}
