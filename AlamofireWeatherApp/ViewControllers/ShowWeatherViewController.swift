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
        
        createGradient(upperColor: UIColor.systemBlue, lowerColor: UIColor.systemGreen, coordinate: 0.9)
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
    

    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    
}


extension ShowWeatherViewController {
    
    func downloadData() {
        guard let url = URL(string: linkToPass) else { return }
        
        let request = AF.request(url)
        
        request.validate().responseJSON { dataResponse in
            switch dataResponse.result {
            case .success(let value):
                
                
                guard let data = value as? Dictionary<String, Any> else { return }

//                for (_, value) in data {
//                    if let trans = value as? String {
//                        print(trans)
//                    } else if let trans = value as? Main {
//                        let temp = trans.temp
//                        let feelsLike = trans.feelsLike
//                        let tempMin = trans.tempMin
//                        let tempMax = trans.tempMax
//                        let pressure = trans.pressure
//                        let humidity = trans.humidity
//                        print(temp, feelsLike, tempMin, tempMax, pressure, humidity)
//                    } else if let trans = value as? Float {
//                        print(trans)
//                    } else if let trans = value as? Clouds {
//                        let clouds = trans.all
//                        print(trans, clouds!)
//                    } else if let trans = value as? [Weather] {
//                        print(trans)
//                    } else if let trans = value as? Sys {
//                        print(trans)
//                    } else if let trans = value as? Coord {
//                        print(trans)
//                    } else if let trans = value as? Wind {
//                        print(trans)
//                    } else {
//                        print("ConvertantoImpotento")
//                    }
//                }
//
//                print("====================")
                let forecast = Forecast(coord: data["coord"] as? Coord,
                                        weather: data["weather"] as? [Weather],
                                        base: data["base"] as? String,
                                        main: data["main"] as? Main,
                                        visibility: data["visibility"] as? Int,
                                        wind: data["wind"] as? Wind,
                                        clouds: data["clouds"] as? Clouds,
                                        dt: data["dt"] as? Int,
                                        sys: data["sys"] as? Sys,
                                        timezone: data["timezone"] as? Int,
                                        id: data["id"] as? Int,
                                        name: data["name"] as? String,
                                        cod: data["cod"] as? Int)

                self.forecastData = forecast

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
            temperatureStatus.text = String(forecast.main?.temp ?? 0)
        }
    }
}
