//
//  WeatherService.swift
//  ProtocolDelegateBlueprintUIKit
//
//  Created by Bartosz Wojtkowiak on 06/06/2023.
//

import Foundation

struct Weather {
    let city: String
    let temperature: String
    let imageName: String
}

protocol WeatherServiceDelegate: AnyObject {
    func didFetchWeather(_ weather: Weather)
}

class WeatherService {
    weak var delegate: WeatherServiceDelegate?
    
    func fetchWeather() {
        let weather = Weather(city: "Leszno", temperature: "25", imageName: "sunset.fill")
        delegate?.didFetchWeather(weather)
    }
}
