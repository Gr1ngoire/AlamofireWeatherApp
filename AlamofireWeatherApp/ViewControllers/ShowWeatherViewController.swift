//
//  ShowWeatherViewController.swift
//  AlamofireWeatherApp
//
//  Created by admin on 21.05.2021.
//

import UIKit

class ShowWeatherViewController: UIViewController {
    
    // necessary outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createGradient(upperColor: UIColor.systemBlue, lowerColor: UIColor.systemGreen)
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    

    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true)
    }
    

}
