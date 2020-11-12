//
//  ViewController.swift
//  Alinea
//
//  Created by Rajagopal Ganesan on 12/11/20.
//

import UIKit

class ViewController: UIViewController {

    private let NavigationTitle = "Explore"
    private let SequenceMenus = ["Category", "Themes", "Trending"]
    private let categoryTableView = UITableView()
    private var themesCollectionView:UICollectionView!
    private let trendingTableView = UITableView()
    private var alinaSegmentedView:AlineaRootSegmentalView!
    private let categoryVM = CategoryViewModel()
    private let themesVM = ThemesViewModel()
    private let trendingVM = TrendingViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.setUpNavigationBar()
        self.setUpAlinaSegmentedView()
        self.setUpCategoryTableView()
        self.setupThemesUI()
        self.setUpTrendingTableView()
        
    }
        
    private func setUpTrendingTableView() {
        
        self.view.addSubview(trendingTableView)
        trendingTableView.translatesAutoresizingMaskIntoConstraints = false
        trendingTableView.topAnchor.constraint(equalTo: self.alinaSegmentedView.bottomAnchor, constant: 10.0).isActive = true
        trendingTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        trendingTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        trendingTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        trendingTableView.register(TrendingTableTableViewCell.self, forCellReuseIdentifier: TRENDINGCELLIDENTIFIER)
        // Change the row height if you want
        trendingTableView.rowHeight = 100
        self.trendingVM.delegate = self
        trendingTableView.isHidden = true
    }
    
    private func setUpCategoryTableView() {
        
        self.view.addSubview(categoryTableView)
        categoryTableView.translatesAutoresizingMaskIntoConstraints = false
        categoryTableView.topAnchor.constraint(equalTo: self.alinaSegmentedView.bottomAnchor, constant: 10.0).isActive = true
        categoryTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        categoryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        categoryTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        categoryTableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CATEGORYCELLIDENTIFIER)
        // Change the row height if you want
        categoryTableView.rowHeight = 100
        self.categoryVM.delegate = self
        self.categoryVM.loadDataSource()
    }
    
    private func setUpNavigationBar() {
        self.navigationItem.title = NavigationTitle
        self.navigationItem.leftBarButtonItem =
            
            UIBarButtonItem(image: UIImage(named: "HamburgerIcon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenu))
        self.navigationItem.rightBarButtonItem =
            
            UIBarButtonItem(image: UIImage(named: "Notification")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenu))
    }
    
    //dummy methods for selectors
    @objc private func handleMenu() {
        AlertController.shared.showAlertWithMessage(alertMess: "Navigation Button", viewController: self)
        
    }
    
    private func setUpAlinaSegmentedView() {
        
        self.alinaSegmentedView = AlineaRootSegmentalView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50), buttonTitle: SequenceMenus)
        self.alinaSegmentedView.backgroundColor = .clear
        self.alinaSegmentedView.delegate = self
        self.view.addSubview(self.alinaSegmentedView)
    }


}

extension ViewController: AlineaRootSegmentalControlDelegate {
    
    func change(to index:Int) {
        
        let value = AlinaSegmentButtons.init(rawValue: index)
            switch value {
            case .Category:
                self.categoryVM.loadDataSource()
                self.categoryTableView.isHidden = false
                self.themesCollectionView.isHidden = true
                self.trendingTableView.isHidden = true
            case .Themes:
                self.themesVM.loadDataSource()
                self.themesCollectionView.isHidden = false
                self.categoryTableView.isHidden = true
                self.trendingTableView.isHidden = true
            case .Trending:
                self.trendingVM.getDataSource()
                self.trendingTableView.isHidden = false
                self.themesCollectionView.isHidden = true
                self.categoryTableView.isHidden = true
            case .none:
                print("nothing matched")
            }
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (tableView === self.categoryTableView) {
            cell.round(corners: [.bottomLeft, .bottomRight, .topLeft, .topRight], withRadius: cell.frame.height/2)
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if (tableView === self.categoryTableView) {
            return CategoryTypes.allCases.count
        }
        //For Trending Tab
        return 2
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView === self.categoryTableView) {
            return 1
        }
        //For Trending Tab
        if (section == 0) {
            return self.trendingVM.gainerModel.count
        } else {
            return self.trendingVM.topSellersModel.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if (tableView === self.categoryTableView) {
            return 30
        }
        //For Trending Tab
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        

        if (tableView === self.categoryTableView) {
            let headerView = UIView()
            headerView.backgroundColor = .clear
            return headerView
        }
        
        //For Trending Tab
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = .white
        let sectionText = UILabel()
        sectionText.frame = CGRect.init(x: 25, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        sectionText.text = "Custom Text"
        sectionText.font = .systemFont(ofSize: 20, weight: .bold)
        sectionText.textColor = .black
        headerView.addSubview(sectionText)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell!
        
        if (tableView === self.categoryTableView) {

            if let cell_ = tableView.dequeueReusableCell(withIdentifier: CATEGORYCELLIDENTIFIER, for: indexPath) as? CategoryTableViewCell {
                
                let category = CategoryTypes.init(rawValue: indexPath.section)
                switch category {
                case .Crypto:
                    cell_.backgroundColor = UIColor(red: 255, green: 224, blue: 93)
                    cell_.categoryName.text = "Crypto"
                    cell_.categoryImage.image = UIImage(named: "BitCoin")
                case .ETF:
                    cell_.backgroundColor = UIColor(red: 92, green: 42, blue: 157)
                    cell_.categoryName.text = "ETFs"
                    cell_.categoryImage.image = UIImage(named: "ETF")
                case .Stocks:
                    cell_.backgroundColor = UIColor(red: 144, green: 136, blue: 212)
                    cell_.categoryName.text = "Stocks"
                    cell_.categoryImage.image = UIImage(named: "Stocks")
                case .none:
                    print("mismatch category")
                }
                cell = cell_
            }

        }
        
        if (tableView === self.trendingTableView) {
            
            var currentModel: TrendModel!
            
            if (indexPath.section == 0) {
                currentModel = self.trendingVM.gainerModel[indexPath.row]
            } else {
                currentModel = self.trendingVM.topSellersModel[indexPath.row]
            }
            
            if let cell_ = tableView.dequeueReusableCell(withIdentifier: TRENDINGCELLIDENTIFIER, for: indexPath) as? TrendingTableTableViewCell {

                cell_.trendName.text = currentModel.trendName
                cell_.trendSubName.text = currentModel.trendSubName
                cell_.trendImage.image = UIImage(named: currentModel.trendImageName ?? "default_image")
                
                if (currentModel.trendValue! > 50) {
                    cell_.priceLabel.backgroundColor = .green
                } else {
                    cell_.priceLabel.backgroundColor = .red
                }
                
                cell_.priceLabel.text = String(currentModel.trendValue!) + "%"
                cell = cell_
                
            }
        }
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (tableView === self.categoryTableView) {

            let category = CategoryTypes.init(rawValue: indexPath.section)
            AlertController.shared.showAlertWithMessage(alertMess: category.debugDescription, viewController: self)
        }
        
    }
    
    
}

extension ViewController: CategoryVMDelegate {
    
    func reloadCategoryData() {
        self.categoryTableView.dataSource = self
        self.categoryTableView.delegate = self
        self.categoryTableView.reloadData()
    }
}

// MARK: - Themes UI Setup
extension ViewController {
    
    private func setupThemesUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        let layout = UICollectionViewFlowLayout()
        self.themesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        self.themesCollectionView.register(ThemesCollectionViewCell.self, forCellWithReuseIdentifier: THEMESCELLIDENTIFIER)
        self.themesCollectionView.backgroundColor = .white
        self.themesCollectionView.translatesAutoresizingMaskIntoConstraints = false
  
        self.view.addSubview(themesCollectionView)
        
        themesCollectionView.topAnchor.constraint(equalTo: self.alinaSegmentedView.bottomAnchor, constant: 10.0).isActive = true
        
        NSLayoutConstraint.activate([
            themesCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            themesCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            themesCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        self.themesCollectionView.isHidden = true
        self.themesVM.delegate = self
    }
    
}

// MARK: - UICollectionViewDelegate & Data Source
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.size.width / 2) - 15, height: collectionView.frame.size.height / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return titles.count
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: UICollectionViewCell!
        
        if let cell_ = collectionView.dequeueReusableCell(withReuseIdentifier: THEMESCELLIDENTIFIER, for: indexPath) as? ThemesCollectionViewCell {
            
            let currentThemeModel = self.themesVM.model[indexPath.row]
            
            cell_.titleLabel.text = currentThemeModel.themeName ?? "No Text"
            cell_.themeImageView.image = UIImage(named: currentThemeModel.image ?? "Default_Image")
            cell = cell_
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let currentThemeModel = self.themesVM.model[indexPath.row]
        AlertController.shared.showAlertWithMessage(alertMess: currentThemeModel.themeName ?? "No value present", viewController: self)
    }
    
}


extension ViewController: ThemesVMDelegate {
    
    func reloadThemesData() {
        self.themesCollectionView.dataSource = self
        self.themesCollectionView.delegate = self
        self.themesCollectionView.reloadData()
    }
}

extension ViewController: TrendingVMDelegate {
    
    func reloadTrendingData() {
        self.trendingTableView.dataSource = self
        self.trendingTableView.delegate = self
        self.trendingTableView.reloadData()
    }
    
}
