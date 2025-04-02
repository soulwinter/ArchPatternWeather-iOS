import SwiftUI

// MV Pattern: View
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

#Preview {
  NavigationStack {
    WeatherListView()
      .navigationTitle("Weather")
  }
  .environment(WeatherServiceWrapper())
}
