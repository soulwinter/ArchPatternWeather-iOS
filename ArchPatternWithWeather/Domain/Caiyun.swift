//
//  Caiyun.swift
//  ArchPatternWithWeather
//
//  Created by Chubo Han on 4/5/25.
//

struct CaiyunResponse: Codable {
    let result: ResultData
}

struct ResultData: Codable {
    let realtime: RealtimeData
}

struct RealtimeData: Codable {
    let temperature: Double
    let apparent_temperature: Double
    let skycon: String
    let wind: WindData
    let humidity: Double
}

struct WindData: Codable {
    let speed: Double
    let direction: Double
}


func skyconToSymbolName(_ skycon: String) -> String {
    switch skycon {
    case "CLEAR_DAY": return "sun.max.fill"
    case "CLEAR_NIGHT": return "moon.stars.fill"
    case "PARTLY_CLOUDY_DAY": return "cloud.sun.fill"
    case "PARTLY_CLOUDY_NIGHT": return "cloud.moon.fill"
    case "CLOUDY": return "cloud.fill"
    case "LIGHT_HAZE", "MODERATE_HAZE", "HEAVY_HAZE": return "smoke.fill"
    case "LIGHT_RAIN": return "cloud.drizzle.fill"
    case "MODERATE_RAIN": return "cloud.rain.fill"
    case "HEAVY_RAIN", "STORM_RAIN": return "cloud.heavyrain.fill"
    case "FOG": return "cloud.fog.fill"
    case "LIGHT_SNOW": return "cloud.snow.fill"
    case "MODERATE_SNOW": return "cloud.snow.fill"
    case "HEAVY_SNOW", "STORM_SNOW": return "snowflake"
    case "DUST", "SAND": return "aqi.medium"
    case "WIND": return "wind"
    default: return "questionmark"
    }
}

func skyconDescription(_ skycon: String) -> String {
    switch skycon {
    case "CLEAR_DAY": return "Clear Day"
    case "CLEAR_NIGHT": return "Clear Night"
    case "PARTLY_CLOUDY_DAY": return "Partly Cloudy"
    case "PARTLY_CLOUDY_NIGHT": return "Partly Cloudy Night"
    case "CLOUDY": return "Cloudy"
    case "LIGHT_HAZE": return "Light Haze"
    case "MODERATE_HAZE": return "Moderate Haze"
    case "HEAVY_HAZE": return "Heavy Haze"
    case "LIGHT_RAIN": return "Light Rain"
    case "MODERATE_RAIN": return "Moderate Rain"
    case "HEAVY_RAIN": return "Heavy Rain"
    case "STORM_RAIN": return "Storm Rain"
    case "FOG": return "Fog"
    case "LIGHT_SNOW": return "Light Snow"
    case "MODERATE_SNOW": return "Moderate Snow"
    case "HEAVY_SNOW": return "Heavy Snow"
    case "STORM_SNOW": return "Snowstorm"
    case "DUST": return "Dust"
    case "SAND": return "Sand"
    case "WIND": return "Windy"
    default: return "Unknown"
    }

}
