//
//  Extension + UIViewController.swift
//  AlamofireWeatherApp
//
//  Created by admin on 21.05.2021.
//

import UIKit

extension UIViewController {
    
    func createGradient(upperColor: UIColor, lowerColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.colors = [upperColor.cgColor, lowerColor.cgColor]
        gradient.locations = [0, 1]
        gradient.frame = view.bounds
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
}
