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
        
        // view setup
        createGradient(upperColor: UIColor.systemBlue, lowerColor: UIColor.systemGreen, coordinates: [0, 0.9, 1], bounds: view.bounds)
        dataStack.isHidden = true
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    // atempt to solve the bug with splitting gradient
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        createGradient(upperColor: UIColor.systemBlue, lowerColor: UIColor.systemGreen, coordinates: [0, 0.9, 1], bounds: view.bounds)
        updateData(forecast: forecastData)
        activityIndicator.stopAnimating()
        dataStack.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        createGradient(upperColor: UIColor.systemBlue, lowerColor: UIColor.systemGreen, coordinates: [0, 0.9, 1], bounds: view.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        createGradient(upperColor: UIColor.systemBlue, lowerColor: UIColor.systemGreen, coordinates: [0, 0.9, 1], bounds: view.bounds)
    }
    
    // goBack button action
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    
}


extension ShowWeatherViewController {
    
    // download data func
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
    
    // upload data func
    func updateData(forecast: Forecast) {
        DispatchQueue.main.async {
            [self] in
            cityName.text = forecast.name ?? ""
            weatherStatus.text = forecast.weather?[0].description ?? ""
            temperatureStatus.text = String(Int(forecast.main?.temp ?? 0.0) - 273)
        }
    }
}
