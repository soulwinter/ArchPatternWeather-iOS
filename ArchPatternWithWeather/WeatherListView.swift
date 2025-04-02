import SwiftUI
import WeatherKit
import CoreLocation

struct WeatherListView: View {
  
  @State private var viewState: ViewState = .loading
  
  enum ViewState {
    case loading
    case success([WeatherItem])
    case failure(Error)
  }
  
  var body: some View {
    ZStack {
      GradientBackground()
      
      switch viewState {
      case .loading:
        LoadingView()
      case .success(let items):
        WeatherListSuccessView(items: items)
      case .failure(let error):
        ErrorView(message: error.localizedDescription)
      }
    }
    .task {
      do {
        let items = try await fetchWeatherList()
        viewState = .success(items)
      } catch {
        viewState = .failure(error)
      }
    }
  }
  
  private func fetchWeatherList() async throws -> [WeatherItem] {
    var items: [WeatherItem] = []
    let weatherService = WeatherService.shared
    let cities = [
      City(name: "New York", location: CLLocation(latitude: 40.7128, longitude: -74.0060)),
      City(name: "Tokyo", location: CLLocation(latitude: 35.6762, longitude: 139.6503)),
      City(name: "Paris", location: CLLocation(latitude: 48.8566, longitude: 2.3522)),
      City(name: "Bangkok", location: CLLocation(latitude: 13.7563, longitude: 100.5018)),
    ]
    
    for city in cities {
      let weather = try await weatherService.weather(for: city.location)
      let currentWeather = weather.currentWeather
      let item = WeatherItem(
        id: UUID(),
        cityName: city.name,
        symbolName: currentWeather.symbolName,
        description: currentWeather.condition.description,
        temperature: currentWeather.temperature,
        apparentTemperature: currentWeather.apparentTemperature,
        windSpeed: currentWeather.wind.speed,
        humidity: currentWeather.humidity
      )
      
      items.append(item)
    }
    
    return items
  }
}

#Preview {
  NavigationStack {
    WeatherListView()
      .navigationTitle("Weather")
  }
}
