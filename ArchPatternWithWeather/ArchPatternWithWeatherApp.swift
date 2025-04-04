//
//  ArchPatternWithWeatherApp.swift
//  ArchPatternWithWeather
//
//  Created by Yossa Bourne on 4/2/25.
//

import SwiftUI

@main
struct ArchPatternWithWeatherApp: App {
  
  let weatherService = WeatherServiceWrapper()
  
  var body: some Scene {
    WindowGroup {
      WeatherListView()
        .environment(weatherService)
    }
  }
}
