import Foundation
@testable import ArchPatternWithWeather

class WeatherServiceWrapperStub: WeatherServiceWrapper {
  
  init(stubbedItems: [WeatherItem]) {
    self.stubbedItems = stubbedItems
  }
  
  let stubbedItems: [WeatherItem]
  
  override func fetchWeatherList() async throws -> [WeatherItem] {
    stubbedItems
  }
}
