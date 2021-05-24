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
        createGradient(upperColor: UIColor.systemPink, lowerColor: UIColor.purple, coordinates: [0, 0.6, 1], bounds: view.bounds)
    }
    
    // attempt to solve the bug with splittig gradient
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        createGradient(upperColor: UIColor.systemPink, lowerColor: UIColor.purple, coordinates: [0, 0.6, 1], bounds: view.bounds)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        createGradient(upperColor: UIColor.systemPink, lowerColor: UIColor.purple, coordinates: [0, 0.6, 1], bounds: view.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        createGradient(upperColor: UIColor.systemPink, lowerColor: UIColor.purple, coordinates: [0, 0.6, 1], bounds: view.bounds)
    }
    
    @IBAction func showForecast(_ sender: Any) {
        performSegue(withIdentifier: "dataPass", sender: self)
    }
    
    // passing the info to ShowWeatherViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dataPass" {
            guard let segue = segue.destination as? ShowWeatherViewController else { return }
            segue.linkToPass = dataLink
            segue.downloadData()
        }
    }
    
}

