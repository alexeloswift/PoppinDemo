//
//  DetailedView.swift
//  PoppinDemo
//
//  Created by Alexis Diaz on 10/3/22.
//

import SwiftUI

struct DetailedView: View {
    @ObservedObject var viewmodel: DetailedViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Latitude: \(viewmodel.lat, specifier: "%. 2f")")
                Text("Longitude: \(viewmodel.lon, specifier: "%. 2f")")
                Text("TimeZone: \(viewmodel.timezone)")
                VStack {
                    Text("Temperature: \(viewmodel.temp, specifier: "%. 0f")")
                    Text("Feels Like: \(viewmodel.feelsLike, specifier: "%. 0f")")
                    Text("Date: \(viewmodel.dt)")
                    Text("Sunrise: \(viewmodel.sunrise)")
                    Text("Sunset: \(viewmodel.sunset)")
                    Text("Pressure: \(viewmodel.pressure)")
                    Text("Humidity %: \(viewmodel.humidity)")
                    Text("Dew Point: \(viewmodel.dewPoint, specifier: "%. 2f")")
                    Text("UVI: \(viewmodel.uvi)")
                    VStack{
                        Text("Cloud %: \(viewmodel.clouds)")
                        Text("Visibilty: \(viewmodel.visibilty)")
                        Text("Wind Speed: \(viewmodel.windSpeed, specifier: "%. 2f")")
                        Text("Wind Direction: \(viewmodel.windDeg)")
                    }
                }
            }
        }
        .navigationTitle(viewmodel.party.partyName)
        .task {
            await viewmodel.fetchData()
        }
        
    }
    
    //    private var weatherStats: some View {
    //        List {
    //            ForEach(viewmodel.currentWeather, id: \.temp) { weather in
    //                Text("\(weather.temp)")
    //            }
    //        }
    //    }
    
    
}


struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(viewmodel: DetailedViewModel(party: Party(partyName: "Tony's Soiree", latitude: 40.670, longitude: -73.940)))
    }
}


//struct WeatherView: View {
//    let weather: Current
//    var body: some View {
//        Text("\(weather.temp)")
//    }
//}
