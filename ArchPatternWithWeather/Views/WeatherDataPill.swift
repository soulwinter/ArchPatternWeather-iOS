import SwiftUI

struct WeatherDataPill: View {
  
  let icon: String
  let value: String
  
  var body: some View {
    HStack {
      Image(systemName: icon)
      
      Text(value)
    }
    .font(.subheadline)
    .padding(.horizontal, 12)
    .padding(.vertical, 8)
    .background {
      Capsule()
        .fill(.white.opacity(0.2))
    }
  }
}
