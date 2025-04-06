import Foundation
import CoreLocation

@Observable
class WeatherServiceWrapper {
    private let token = "YOUR_CAIYUN_API_KEY" // replace by your caiyun weather token

    func fetchWeatherList() async throws -> [WeatherItem] {
        var items: [WeatherItem] = []

        let cities = [
            City(name: "Beijing", location: CLLocation(latitude: 39.9042, longitude: 116.4074)),
            City(name: "Shanghai", location: CLLocation(latitude: 31.2304, longitude: 121.4737)),
            City(name: "Guangzhou", location: CLLocation(latitude: 23.1291, longitude: 113.2644)),
            City(name: "Shenzhen", location: CLLocation(latitude: 22.5431, longitude: 114.0579)),
           
        ]

        for city in cities {
            let lat = city.location.coordinate.latitude
            let lon = city.location.coordinate.longitude
            let urlString = "https://api.caiyunapp.com/v2.6/\(token)/\(lon),\(lat)/weather.json"
            guard let url = URL(string: urlString) else { continue }

            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(CaiyunResponse.self, from: data)
            let realtime = decoded.result.realtime

            let symbolName = skyconToSymbolName(realtime.skycon)
            let description = skyconDescription(realtime.skycon)

            let item = WeatherItem(
                id: UUID(),
                cityName: city.name,
                symbolName: symbolName,
                description: description,
                temperature: Measurement(value: realtime.temperature, unit: .celsius),
                apparentTemperature: Measurement(value: realtime.apparent_temperature, unit: .celsius),
                windSpeed: Measurement(value: realtime.wind.speed, unit: .metersPerSecond),
                humidity: realtime.humidity
            )
            items.append(item)
        }

        return items
    }
}

