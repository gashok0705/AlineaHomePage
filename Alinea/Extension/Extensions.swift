//
//  Extensions.swift
//  Alinea
//
//  Created by Rajagopal Ganesan on 12/11/20.
//
import UIKit

extension UITableViewCell {
    func round(corners: UIRectCorner, withRadius radius: CGFloat) {
        let mask = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.frame = self.bounds
        shape.path = mask.cgPath
        self.layer.mask = shape
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

extension String {
    func floatValue() -> Float? {
        return Float(self)
    }
}
