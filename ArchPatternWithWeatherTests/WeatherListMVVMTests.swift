import Testing
@testable import ArchPatternWithWeather

/// This test shows how to perform unit testing in MVVM Pattern.
/// There's only one test case just to demonstrate the possibility.
struct WeatherListMVVMTests {
  
  @MainActor
  @Test
  func fetchWeatherSetSuccessStateOnSuccess() async throws {
    // Arrange
    let items = WeatherItem.mocks
    let service = WeatherServiceWrapperStub(stubbedItems: items)
    let sut = WeatherListViewModel(weatherService: service)
    
    // Act
    await sut.fetch()
    
    // Assert
    guard case .success(let fetchedItems) = sut.viewState else {
      Issue.record("View state is not .success, found: \(sut.viewState) instead.")
      return
    }
    
    #expect(fetchedItems == items)
  }
}
