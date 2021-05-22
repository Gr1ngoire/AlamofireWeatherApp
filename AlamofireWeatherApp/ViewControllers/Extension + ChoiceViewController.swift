//
//  Extension + ViewController.swift
//  AlamofireWeatherApp
//
//  Created by admin on 22.05.2021.
//

import UIKit

extension ChoiceViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CityInitializer.giveCities().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CityInitializer.giveCities()[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let citytoPerform = CityInitializer.giveCities()[row].name
        let shortNameToPerform = CityInitializer.giveCities()[row].shortName
        let codeToPerform = CityInitializer.giveCities()[row].code
        dataLink = "http://api.openweathermap.org/data/2.5/weather?q=\(citytoPerform),\(shortNameToPerform),\(codeToPerform)&appid=81be0b9fd939f7a141f2f5aa5ad0b4d9"
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: CityInitializer.giveCities()[row].name, attributes: [NSAttributedString.Key.foregroundColor : UIColor.cyan])
        return attributedString
    }
}
