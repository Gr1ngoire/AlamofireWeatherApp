//
//  Extension + UIViewController.swift
//  AlamofireWeatherApp
//
//  Created by admin on 21.05.2021.
//

import UIKit

extension UIViewController {
    
    // function to draw gradient
    func createGradient(upperColor: UIColor, lowerColor: UIColor, coordinates: [NSNumber], bounds: CGRect) {
        let gradient = CAGradientLayer()
        gradient.colors = [upperColor.cgColor, lowerColor.cgColor]
        gradient.locations = coordinates
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = bounds
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    
    func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAlert = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(cancelAlert)
        present(alert, animated: true)
    }
    
}
