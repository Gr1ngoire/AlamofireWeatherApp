//
//  dataManager.swift
//  AlamofireWeatherApp
//
//  Created by admin on 13.06.2021.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private var shortWeather = ShortWeather()
    
    private let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    private var archieveURL: URL!
    
    init() {
        archieveURL = documentDirectory.appendingPathComponent("ShortWeather").appendingPathExtension("plist")
    }
    
    func saveShortWeather(shortWeather: ShortWeather) {
        let encoder = PropertyListEncoder()
        guard let data = try? encoder.encode(shortWeather) else { return }
        try? data.write(to: archieveURL, options: .noFileProtection)
    }
    
    func getShortWeatherFromFile() -> ShortWeather {
        guard let savedShortWeather = try? Data(contentsOf: archieveURL) else { return shortWeather }
        let decoder = PropertyListDecoder()
        guard let loadedWeather = try? decoder.decode(ShortWeather.self, from: savedShortWeather) else {
            return shortWeather
        }
        
        shortWeather = loadedWeather
        return shortWeather
    }
}
