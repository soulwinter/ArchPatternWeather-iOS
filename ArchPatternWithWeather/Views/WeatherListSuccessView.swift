import SwiftUI

struct WeatherListSuccessView: View {
  let items: [WeatherItem]
  
  var body: some View {
    ScrollView {
      VStack {
        ForEach(items) { item in
          WeatherCard(item: item)
        }
      }
      .padding(.horizontal)
    }
  }
}
