import SwiftUI
import WeatherKit
import CoreLocation

struct WeatherListView: View {
  
  @Environment(WeatherServiceWrapper.self) var weatherService
  @State private var viewState: WeatherListViewState = .loading
  
  var body: some View {
    WeatherListRenderingView(viewState: viewState)
      .task {
        do {
          let items = try await weatherService.fetchWeatherList()
          viewState = .success(items)
        } catch {
          viewState = .failure(error)
        }
      }
  }
}

enum WeatherListViewState {
  case loading
  case success([WeatherItem])
  case failure(Error)
}

struct WeatherListRenderingView: View {
  
  let viewState: WeatherListViewState
  
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
  }
}

#Preview {
  NavigationStack {
    WeatherListView()
      .navigationTitle("Weather")
  }
  .environment(WeatherServiceWrapper())
}
