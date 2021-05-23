//
//  ShowWeatherViewController.swift
//  AlamofireWeatherApp
//
//  Created by admin on 21.05.2021.
//

import UIKit
import Alamofire

class ShowWeatherViewController: UIViewController {
    
    // necessary outlets
    @IBOutlet weak var dataStack: UIStackView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherStatus: UILabel!
    @IBOutlet weak var temperatureStatus: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // necessary data variables
    var linkToPass: String!
    var temp: NSNumber!
    var forecastData: Forecast!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createGradient(upperColor: UIColor.systemBlue, lowerColor: UIColor.systemGreen, coordinate: 0.9, size: self.view.bounds)
        dataStack.isHidden = true
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        updateData(forecast: forecastData)
        activityIndicator.stopAnimating()
        dataStack.isHidden = false
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super .viewWillTransition(to: size, with: coordinator)
        createGradient(upperColor: UIColor.systemBlue, lowerColor: UIColor.systemGreen, coordinate: 0.9, size: self.view.bounds)
    }

    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    
}


extension ShowWeatherViewController {
    
    func downloadData() {
        guard let url = URL(string: linkToPass) else { return }
        
        let request = AF.request(url)
        
        request.validate().responseDecodable(of: Forecast.self) {
            dataResponse in
            
            switch dataResponse.result {
            case .success(let data):
                
                self.forecastData = data

                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func updateData(forecast: Forecast) {
        DispatchQueue.main.async {
            [self] in
            cityName.text = forecast.name ?? ""
            weatherStatus.text = forecast.weather?[0].description ?? ""
            temperatureStatus.text = String(Int(forecast.main?.temp ?? 0.0) - 273)
        }
    }
}
