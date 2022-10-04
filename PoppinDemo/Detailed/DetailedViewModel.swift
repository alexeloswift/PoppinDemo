//
//  DetailedViewModel.swift
//  PoppinDemo
//
//  Created by Alexis Diaz on 10/3/22.
//

import Foundation

class DetailedViewModel: ObservableObject {
    @Published var lat: Double = 0.0
    @Published var lon: Double = 0.0
    @Published var timezone: String = ""
    @Published var temp: Double = 0.0
    @Published var feelsLike: Double = 0.0
    @Published var pressure: Int = 0
    @Published var humidity: Int = 0
    @Published var dewPoint: Double = 0.0
    @Published var uvi: Double = 0.0
    @Published var clouds: Int = 0
    @Published var visibilty: Int = 0
    @Published var windSpeed: Double = 0.0
    @Published var windDeg: Int = 0
    @Published var currentDate: String = ""
    @Published var currentSunset: String = ""
    @Published var currentSunrise: String = ""
    @Published var description: String = ""

    var party: Party
    
    init(party: Party) {
        self.party = party
    }

    @MainActor
    func fetchData() async {
        let urlString = "https://api.openweathermap.org/data/3.0/onecall?lat=\(party.latitude)&lon=\(party.longitude)&units=imperial&exclude=minutely,hourly,alerts,daily&appid=\(PlistParser.getStringValue(forkey: "WeatherAPIKey"))"
        if let url = URL(string: urlString) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                let response = try decoder.decode(Root.self, from: data)
                print(response)
                self.lat = response.lat
                self.lon = response.lon
                self.timezone = response.timezone
                self.temp = response.current.temp
                self.feelsLike = response.current.feelsLike
                self.dt = response.current.dt
                self.sunrise = response.current.sunrise
                self.sunset = response.current.sunset
                self.pressure = response.current.pressure
                self.humidity = response.current.humidity
                self.dewPoint = response.current.dewPoint
                self.uvi = response.current.uvi
                self.clouds = response.current.clouds
                self.visibilty = response.current.visibility
                self.windSpeed = response.current.windSpeed
                self.windDeg = response.current.windDeg
                
                let weatherResponse = response.current.weather
                self.description = weatherResponse[0].weatherDescription
                self.iconString = weatherResponse[0].icon
            } catch {
                print(String(describing: error))
            }
        }
    }
    
//    MARK: - CONVERTING INT TO STRING FOR DATE/SUNRISE/SUNSET
    
    var dt: Int = 0
    var sunrise: Int = 0
    var sunset: Int = 0
    
    func getDate(dt: Int) {
        let date = Date(timeIntervalSinceNow: Double(dt))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE d"
        currentDate = dateFormatter.string(from: date)
    }
    
    func getSunrise(dt: Int) {
        let date = Date(timeIntervalSinceNow: Double(sunrise))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        currentSunrise = dateFormatter.string(from: date)
    }
    
    func getSunset(dt: Int) {
        let date = Date(timeIntervalSinceNow: Double(sunset))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        currentSunset = dateFormatter.string(from: date)
    }
    
//    MARK: - CONVERTING STRING TO URL FOR IMAGE ICON
    
    var iconString: String = ""
    var iconURL: URL {
        let urlString = "https://openweathermap.org/img/wn/\(iconString)@2x.png"
        return URL(string: urlString)!
    }
}





