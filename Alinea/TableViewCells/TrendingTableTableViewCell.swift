//
//  TrendingTableTableViewCell.swift
//  Alinea
//
//  Created by Rajagopal Ganesan on 12/11/20.
//

import UIKit

class TrendingTableTableViewCell: UITableViewCell {

    let trendName = UILabel()
    let trendSubName = UILabel()
    let trendImage = UIImageView()
    let priceLabel = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        // Set any attributes of your UI components here.
        trendName.translatesAutoresizingMaskIntoConstraints = false
        trendSubName.translatesAutoresizingMaskIntoConstraints = false
        trendImage.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false

        trendImage.contentMode = .scaleAspectFit
        
        trendName.font = UIFont.boldSystemFont(ofSize: 20.0)
        trendName.textColor = .black
        
        trendSubName.font = UIFont.boldSystemFont(ofSize: 17.0)
        trendSubName.textColor = .systemGray
        
        priceLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        priceLabel.textColor = .white
        priceLabel.textAlignment = .center
        
        priceLabel.layer.masksToBounds = true
        priceLabel.layer.cornerRadius = 15
        
        // Add the UI components
        contentView.addSubview(trendImage)
        contentView.addSubview(trendName)
        contentView.addSubview(trendSubName)
        contentView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            trendImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            trendImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            trendImage.heightAnchor.constraint(equalToConstant: 50),
            trendImage.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            trendName.leadingAnchor.constraint(equalTo: trendImage.leadingAnchor, constant: 80),
            //trendName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            trendName.topAnchor.constraint(equalTo: trendImage.topAnchor, constant: -10),
            trendName.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            trendSubName.leadingAnchor.constraint(equalTo: trendImage.leadingAnchor, constant: 80),
            trendSubName.topAnchor.constraint(equalTo: trendImage.topAnchor, constant: 20),
            trendSubName.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 30),
            priceLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 100)

        ])
    }

}
