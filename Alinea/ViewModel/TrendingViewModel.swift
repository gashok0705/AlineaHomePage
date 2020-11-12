//
//  TrendingViewModel.swift
//  Alinea
//
//  Created by Rajagopal Ganesan on 12/11/20.
//

import UIKit

protocol TrendingVMDelegate: class {
    func reloadTrendingData()
}

class TrendingViewModel: NSObject {

    lazy var gainerModel = [TrendModel]()
    lazy var topSellersModel = [TrendModel]()
    
    weak var delegate: TrendingVMDelegate?
    
    public func getDataSource() {
        
        self.getTrendModelLists()
    }
    
    private func getTrendModelLists() {
        
        //Setting static data
        for (key, value) in TOPGAINERSConstants {
            let gainerMod = TrendModel()
            gainerMod.trendName = key
            gainerMod.trendSubName = ThemesConstant.randomElement()
            gainerMod.trendValue = value.floatValue()
            gainerMod.trendImageName = ImagesConstants.randomElement()
            self.gainerModel.append(gainerMod)
        }
        
        for (key, value) in TOPSELLERSConstants {
            let sellerMod = TrendModel()
            sellerMod.trendName = key
            sellerMod.trendSubName = ThemesConstant.randomElement()
            sellerMod.trendValue = value.floatValue()
            sellerMod.trendImageName = ImagesConstants.randomElement()
            self.topSellersModel.append(sellerMod)
        }
        
        if let delegate_ = delegate {
            delegate_.reloadTrendingData()
        }
    }
}
