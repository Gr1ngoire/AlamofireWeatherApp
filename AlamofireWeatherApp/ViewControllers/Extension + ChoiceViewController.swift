//
//  Extension + ViewController.swift
//  AlamofireWeatherApp
//
//  Created by admin on 22.05.2021.
//

import UIKit

extension ChoiceViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // City picker setup
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return City.getCities().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return City.getCities()[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let citytoPerform = City.getCities()[row].name == "New York" ? "New%20York" : City.getCities()[row].name
        let shortNameToPerform = City.getCities()[row].shortName
        let codeToPerform = City.getCities()[row].code
        dataLink = "http://api.openweathermap.org/data/2.5/weather?q=\(citytoPerform),\(shortNameToPerform),\(codeToPerform)&appid=81be0b9fd939f7a141f2f5aa5ad0b4d9"
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: City.getCities()[row].name, attributes: [NSAttributedString.Key.foregroundColor : UIColor.cyan])
        return attributedString
    }
}
