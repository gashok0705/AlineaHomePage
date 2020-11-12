//
//  Constants.swift
//  Alinea
//
//  Created by Rajagopal Ganesan on 12/11/20.
//


let CATEGORYCELLIDENTIFIER = "categorycellidentifier"
let THEMESCELLIDENTIFIER = "themescellidentifier"
let TRENDINGCELLIDENTIFIER = "trendingcellidentifier"

enum AlinaSegmentButtons: Int {
    case Category = 0
    case Themes
    case Trending
}

enum CategoryTypes: Int, CaseIterable {
    case Stocks = 0
    case ETF
    case Crypto
}

let ThemesConstant: [String] = ["Diversity & Inclusion", "Bold Biotech", "Crypto Central", "She runs it", "Clean & Green", "Cannabis-ness", "Power it", "Foodie Fun", "Art & Fashion", "The heart is"]

let ImagesConstants: [String] = ["coronavirus", "girl", "energy", "Diversity", "BitCoin", "Diversity", "coronavirus", "ETF", "girl", "Stocks"]

let TOPGAINERSConstants: [String: String] = ["Medifast": "+50.78",
                                             "Pinterest": "-4.77",
                                             "Slack Technologies": "-5.77",
                                             "Evoqua Water": "+5.99",
                                             "Evoqua Water1": "+5.99"]

let TOPSELLERSConstants: [String: String] = ["Medifast": "+50.78",
                                             "Slack Technologies": "-5.77",
                                             "Evoqua Water": "+5.99"]

