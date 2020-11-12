//
//  ThemesCollectionViewCell.swift
//  Alinea
//
//  Created by Rajagopal Ganesan on 12/11/20.
//

import UIKit

class ThemesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    
    // MARK: - Properties
    lazy var roundedBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.borderWidth = 0.1
        view.backgroundColor = UIColor.systemGray.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var themeImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 75.0, height: 75.0))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
}

// MARK: - UI Setup
extension ThemesCollectionViewCell {
    private func setupUI() {
        self.contentView.addSubview(roundedBackgroundView)
        roundedBackgroundView.addSubview(titleLabel)
        roundedBackgroundView.addSubview(themeImageView)
        
        NSLayoutConstraint.activate([
                        
            roundedBackgroundView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            roundedBackgroundView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            roundedBackgroundView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
            roundedBackgroundView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5),
            
            themeImageView.centerXAnchor.constraint(equalTo: roundedBackgroundView.centerXAnchor),
            themeImageView.widthAnchor.constraint(equalToConstant: 75),
            themeImageView.heightAnchor.constraint(equalToConstant: 75),
            themeImageView.centerYAnchor.constraint(equalTo: roundedBackgroundView.centerYAnchor),

            titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0),
            titleLabel.leftAnchor.constraint(equalTo: self.roundedBackgroundView.leftAnchor, constant: 5),
            titleLabel.rightAnchor.constraint(equalTo: self.roundedBackgroundView.rightAnchor, constant: -5),
            titleLabel.heightAnchor.constraint(equalToConstant: 15),
            titleLabel.bottomAnchor.constraint(equalTo: self.roundedBackgroundView.bottomAnchor, constant: -25.0)            
        ])
        
        
    }
}
