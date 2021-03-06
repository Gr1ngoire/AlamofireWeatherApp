//
//  City.swift
//  AlamofireWeatherApp
//
//  Created by admin on 21.05.2021.
//

import UIKit

struct City {
    var name: String
    var shortName: String
    var code: String
    
    static func getCities() -> [City] {
        return [
            City(name: "Kyiv",
                 shortName: "ua",
                 code: "380"
            ),
            
            City(name: "Tokyo",
                 shortName: "jpa",
                 code: "81"
            ),
            
            City(name: "Paris",
                 shortName: "fr",
                 code: "33"
            ),
            
            City(name: "New York",
                 shortName: "us",
                 code: "1"
            ),
            
            City(name: "Berlin",
                 shortName: "de",
                 code: "49"
            ),
            
            City(name: "Vienna",
                 shortName: "aut",
                 code: "43"
            ),
            
            City(name: "London",
                 shortName: "gbr",
                 code: "44"
            ),
            
            City(name: "Rome",
                 shortName: "ita",
                 code: "39"
            ),
            
            City(name: "Prague",
                 shortName: "cze",
                 code: "420"
            ),
            
            City(name: "Vancouver",
                 shortName: "can",
                 code: "1"
            )
        ]
    }
}
