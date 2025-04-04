import Foundation
@testable import ArchPatternWithWeather

extension WeatherItem {
  static var mocks: [WeatherItem] {
    [
      WeatherItem(
        id: UUID(),
        cityName: "New York",
        symbolName: "sun.max.fill",
        description: "Sunny",
        temperature: Measurement(value: 25, unit: .celsius),
        apparentTemperature: Measurement(value: 26, unit: .celsius),
        windSpeed: Measurement(value: 10, unit: .kilometersPerHour),
        humidity: 0.65
      ),
      WeatherItem(
        id: UUID(),
        cityName: "Tokyo",
        symbolName: "cloud.rain.fill",
        description: "Rainy",
        temperature: Measurement(value: 18, unit: .celsius),
        apparentTemperature: Measurement(value: 17, unit: .celsius),
        windSpeed: Measurement(value: 15, unit: .kilometersPerHour),
        humidity: 0.85
      ),
      WeatherItem(
        id: UUID(),
        cityName: "Paris",
        symbolName: "cloud.fill",
        description: "Cloudy",
        temperature: Measurement(value: 20, unit: .celsius),
        apparentTemperature: Measurement(value: 19, unit: .celsius),
        windSpeed: Measurement(value: 12, unit: .kilometersPerHour),
        humidity: 0.75
      ),
      WeatherItem(
        id: UUID(),
        cityName: "Bangkok",
        symbolName: "cloud.sun.fill",
        description: "Partly Cloudy",
        temperature: Measurement(value: 32, unit: .celsius),
        apparentTemperature: Measurement(value: 35, unit: .celsius),
        windSpeed: Measurement(value: 8, unit: .kilometersPerHour),
        humidity: 0.70
      )
    ]
  }
}
