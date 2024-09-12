//
//  WeatherResponse.swift
//  WeatherForecast
//
//  Created by 渡邉 華輝 on 2024/09/06.
//

struct WeatherResponse: Codable {
    let maxTemperature: Int
    let date: String
    let minTemperature: Int
    let weatherCondition: WeatherCondition
    
    enum CodingKeys: String, CodingKey {
        case maxTemperature = "max_temperature"
        case date
        case minTemperature = "min_temperature"
        case weatherCondition = "weather_condition"
    }
}
