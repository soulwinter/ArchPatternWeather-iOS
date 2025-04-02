import Foundation

enum WeatherListViewState {
  case loading
  case success([WeatherItem])
  case failure(Error)
}
