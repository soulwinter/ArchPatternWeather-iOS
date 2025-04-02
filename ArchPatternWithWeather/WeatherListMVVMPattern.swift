import SwiftUI
import WeatherKit
import CoreLocation

struct WeatherListMVVMPatternView: View {
  
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
  
  @MainActor
  private func fetchWeatherList() async throws -> [WeatherItem] {
    var items: [WeatherItem] = []
    let weatherService = WeatherService.shared
    let cities = [
      "New York": CLLocation(latitude: 40.7128, longitude: -74.0060),
      "Tokyo": CLLocation(latitude: 35.6762, longitude: 139.6503),
      "Paris": CLLocation(latitude: 48.8566, longitude: 2.3522),
      "Bangkok": CLLocation(latitude: 13.7563, longitude: 100.5018)
    ]
    
    for (city, location) in cities {
      let weather = try await weatherService.weather(for: location)
      let currentWeather = weather.currentWeather
      let item = WeatherItem(
        id: UUID(),
        cityName: city,
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
    WeatherListMVVMPatternView()
      .navigationTitle("Weather")
  }
}
