//
//  ShortWeather.swift
//  AlamofireWeatherApp
//
//  Created by admin on 13.06.2021.
//

import Foundation

struct ShortWeather: Encodable, Decodable {
    var temp = "Temp"
    var weather = "Weather"
    
    var encoded: Data? {
        let encoder = PropertyListEncoder()
        return try? encoder.encode(self)
    }
    
    init() {}
    
    init?(from data: Data) {
        let decoder = PropertyListDecoder()
        guard let shortWeather = try? decoder.decode(ShortWeather.self, from: data) else { return }
        temp = shortWeather.temp
        weather = shortWeather.weather
    }
}
