//
//  CategoryTableViewCell.swift
//  Alinea
//
//  Created by Rajagopal Ganesan on 12/11/20.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    let categoryName = UILabel()
    let categoryImage = UIImageView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var frame: CGRect {
            get {
                return super.frame
            }
            set (newFrame) {
                var frame = newFrame
                frame.origin.x += 20
                frame.size.width -= 2 * 20
                super.frame = frame
            }
        }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        // Set any attributes of your UI components here.
        categoryName.translatesAutoresizingMaskIntoConstraints = false
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        categoryImage.contentMode = .scaleAspectFit
        
        categoryName.font = UIFont.boldSystemFont(ofSize: 20.0)
        categoryName.textColor = .white
        
        // Add the UI components
        contentView.addSubview(categoryImage)
        contentView.addSubview(categoryName)
        
        NSLayoutConstraint.activate([
            categoryImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            categoryImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            categoryImage.heightAnchor.constraint(equalToConstant: 50),
            categoryImage.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            categoryName.leadingAnchor.constraint(equalTo: categoryImage.leadingAnchor, constant: 80),
            categoryName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            categoryName.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
