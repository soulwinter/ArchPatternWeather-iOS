import SwiftUI

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
