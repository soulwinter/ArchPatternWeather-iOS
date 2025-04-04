import SwiftUI

struct GradientBackground: View {
  var body: some View {
    MeshGradient(
      width: 3,
      height: 3,
      points: [
        [0.0, 0.0], [0.3, 0.0], [1.0, 0.0],
        [0.0, 0.4], [0.5, 0.6], [1.0, 0.4],
        [0.0, 1.0], [0.7, 1.0], [1.0, 1.0],
      ],
      colors: [
        Color(red: 0.85, green: 0.95, blue: 1.0, opacity: 0.7),
        Color(red: 0.8, green: 0.9, blue: 1.0, opacity: 0.8),
        Color(red: 0.75, green: 0.85, blue: 0.95, opacity: 0.7),
        Color(red: 0.8, green: 0.9, blue: 0.95, opacity: 0.8),
        Color(red: 0.85, green: 0.9, blue: 1.0, opacity: 0.7),
        Color(red: 0.8, green: 0.85, blue: 0.95, opacity: 0.8),
        Color(red: 0.75, green: 0.9, blue: 1.0, opacity: 0.7),
        Color(red: 0.8, green: 0.85, blue: 1.0, opacity: 0.8),
        Color(red: 0.85, green: 0.9, blue: 0.95, opacity: 0.7),
      ]
    )
    .ignoresSafeArea()
  }
}

#Preview {
  GradientBackground()
}
