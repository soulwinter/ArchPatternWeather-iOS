import SwiftUI
import WeatherKit
import CoreLocation

@Observable
class WeatherListViewModel {
  
  init(weatherService: WeatherServiceWrapper) {
    self.weatherService = weatherService
  }
  
  let weatherService: WeatherServiceWrapper
  var viewState: WeatherListViewState = .loading
  
  func fetch() async {
    do {
      let items = try await weatherService.fetchWeatherList()
      viewState = .success(items)
    } catch {
      viewState = .failure(error)
    }
  }
}

struct WeatherListMVVMView: View {
  
  @State var viewModel: WeatherListViewModel
  
  var body: some View {
    WeatherListRenderingView(viewState: viewModel.viewState)
      .task {
        await viewModel.fetch()
      }
  }
}

#Preview {
  let viewModel = WeatherListViewModel(weatherService: WeatherServiceWrapper())
  
  NavigationStack {
    WeatherListMVVMView(viewModel: viewModel)
      .navigationTitle("Weather")
  }
  .environment(WeatherServiceWrapper())
}
