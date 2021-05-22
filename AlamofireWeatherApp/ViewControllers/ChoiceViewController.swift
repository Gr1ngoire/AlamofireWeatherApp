//
//  ViewController.swift
//  AlamofireWeatherApp
//
//  Created by admin on 21.05.2021.
//

import UIKit

class ChoiceViewController: UIViewController {
    
    // required outlets
    @IBOutlet weak var cityPicker: UIPickerView!
    
    // necessary data
    var dataLink = "http://api.openweathermap.org/data/2.5/weather?q=Kyiv,ua,380&appid=81be0b9fd939f7a141f2f5aa5ad0b4d9"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // picker setup
        self.cityPicker.delegate = self
        self.cityPicker.dataSource = self
        
        // view setup
        createGradient(upperColor: UIColor.systemPink, lowerColor: UIColor.purple, coordinate: 0.5)
    }
    


}

