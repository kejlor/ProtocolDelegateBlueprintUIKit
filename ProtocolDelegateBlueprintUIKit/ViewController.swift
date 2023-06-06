//
//  ViewController.swift
//  ProtocolDelegateBlueprintUIKit
//
//  Created by Bartosz Wojtkowiak on 06/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let weatherService = WeatherService()
    let stackView = UIStackView()
    let weatherImage = UIImageView()
    let weatherTextLabel = UILabel()
    let weatherTemperatureLabel = UILabel()
    let weatherButton = UIButton(type: .system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
        weatherService.delegate = self
    }
}

extension ViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        weatherTextLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherTextLabel.text = "Welcome"
        weatherTextLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        weatherTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherTemperatureLabel.text = "Temperature"
        weatherTemperatureLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        
        weatherButton.translatesAutoresizingMaskIntoConstraints = false
        weatherButton.configuration = .filled()
        weatherButton.configuration?.imagePadding = 8 // for indicator spacing
        weatherButton.setTitle("Get weather", for: [])
        weatherButton.addTarget(self, action: #selector(weatherPressed), for: .primaryActionTriggered)
    }
    
    func layout() {
        stackView.addArrangedSubview(weatherTextLabel)
        stackView.addArrangedSubview(weatherTemperatureLabel)
        stackView.addArrangedSubview(weatherImage)
        stackView.addArrangedSubview(weatherButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc func weatherPressed() {
        weatherService.fetchWeather()
    }
}

extension ViewController: WeatherServiceDelegate {
    func didFetchWeather(_ weather: Weather) {
        weatherTextLabel.text = weather.city
        weatherTemperatureLabel.text = weather.temperature
        let image = UIImage(systemName: weather.imageName)
        weatherImage.image = image
    }
}

