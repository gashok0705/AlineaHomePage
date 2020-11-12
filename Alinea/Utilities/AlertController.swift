//
//  AlertController.swift
//  Alinea
//
//  Created by Rajagopal Ganesan on 12/11/20.
//

import UIKit

class AlertController: NSObject {

    static let shared = AlertController()
    
    private override init() { }
    
    func showAlertWithMessage(alertMess: String, viewController: UIViewController) {
        let alert = UIAlertController(title: "Get our Pro Version!", message: "You have selected " + alertMess, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))

        viewController.present(alert, animated: true)
    }
}
