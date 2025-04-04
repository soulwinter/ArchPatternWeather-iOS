import Foundation

struct WeatherItem: Identifiable {
  let id: UUID
  let cityName: String
  let symbolName: String
  let description: String
  let temperature: Measurement<UnitTemperature>
  let apparentTemperature: Measurement<UnitTemperature>
  let windSpeed: Measurement<UnitSpeed>
  let humidity: Double
}
