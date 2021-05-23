//
//  Forecast.swift
//  AlamofireWeatherApp
//
//  Created by admin on 22.05.2021.
//

import UIKit

struct Coord: Decodable {
    var lon: Float?
    var lat: Float?
}

struct  Weather: Decodable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct Main: Decodable {
    var temp: Float?
    var feelsLike: Float?
    var tempMin: Float?
    var tempMax: Float?
    var pressure: Int?
    var humidity: Int?
    
    enum CodingKeys: String, CodingKey {
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

struct Wind: Decodable {
    var speed: Float?
    var deg: Int?
}

struct Clouds: Decodable {
    var all: Int?
}

struct Sys: Decodable {
    var type: Int?
    var id: Int?
    var country: String?
    var sunrise: Int?
    var sunset: Int?
}

struct Forecast: Decodable {
    var coord: Coord?
    var weather: [Weather]?
    var base: String?
    var main: Main?
    var visibility: Int?
    var wind: Wind?
    var clouds: Clouds?
    var dt: Int?
    var sys: Sys?
    var timezone: Int?
    var id: Int?
    var name: String?
    var cod: Int?
    
//    enum CodingStatements: String, CodingKey {
//        case coord = "coord"
//        case weather = "weather"
//        case base = "base"
//        case main = "main"
//        case visibility = "visibility"
//        case wind = "wind"
//        case clouds = "clouds"
//        case dt = "dt"
//        case sys  = "sys"
//        case timezone = "timezone"
//        case id = "id"
//        case name = "name"
//        case cod = "cod"
//    }
//    
}
