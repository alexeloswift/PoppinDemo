//
//  DetailedView.swift
//  PoppinDemo
//
//  Created by Alexis Diaz on 10/3/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailedView: View {
    
    @StateObject var viewmodel: DetailedViewModel
    
    //    MARK: - BODY QUICK VIEW
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ScrollView {
                    Spacer()
                    allBodyComponents
                        .frame(width: geo.size.width)
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle(viewmodel.party.partyName)
            .task {
                await viewmodel.fetchData()
                viewmodel.getDate(dt: viewmodel.dt)
                viewmodel.getSunrise(dt: viewmodel.sunrise)
                viewmodel.getSunset(dt: viewmodel.sunset)
            }
        }
        .preferredColorScheme(.dark)
        
    }
    
    //    MARK: - BODY COMPOSITION
    
    private var allBodyComponents: some View {
        VStack(spacing: 18) {
            header
            HStack(spacing: 20) {
                date
                timezone
            }
            HStack(spacing:  20) {
                latitude
                longitude
            }
            HStack(spacing: 20) {
                temp
                feelsLike
            }
            HStack(spacing: 20) {
                sunrise
                sunset
            }
            HStack(spacing: 20) {
                humidity
                pressure
            }
            HStack(spacing: 20) {
                dewPoint
                uvi
            }
            HStack(spacing: 20) {
                cloudiness
                visibilty
            }
            HStack(spacing: 20) {
                windSpeed
                windDirection
            }
        }
    }
    
    //    MARK: - BODY COMPONENTS COMPOSITION
    
    private var header: some View {
        VStack {
            WebImage(url: viewmodel.iconURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            Text("\(viewmodel.description)")
                .font(.largeTitle.bold())
        }
        .padding()
        .frame(width: 350, height: 200)
        .overlay(
            RoundedRectangle(cornerRadius: 9)
                .stroke(Color.purple, lineWidth: 2.5))
        .background(
            .regularMaterial,
            in: RoundedRectangle(cornerRadius: 9, style: .continuous))
    }
    
    private var date: some View {
        VStack {
            HStack {
                Image(systemName: "calendar.circle")
                    .padding(.leading, 10)
                Text("Date")
            }
            .modifier(DetailedShortTitleViewMod())
            Spacer()
            HStack {
                Text("\(viewmodel.currentDate)")
                    .font(.title)
            }
            Spacer()
        }
        .modifier(DetailedBoxViewMod())
    }
    
    private var timezone: some View {
        VStack {
            HStack {
                Image(systemName: "location.north")
                Text("Timezone")
            }
            .modifier(DetailedTitleViewMod())
            Spacer()
            HStack {
                Text("\(viewmodel.timezone)")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
            }
            Spacer()
        }
        .modifier(DetailedBoxViewMod())
    }
    
    private var latitude: some View {
        VStack {
            HStack {
                Image(systemName: "mappin")
                Text("Latitude")
            }
            .modifier(DetailedTitleViewMod())
            Spacer()
            HStack {
                Text("\(viewmodel.lat, specifier: "%. 2f")\u{00B0}")
                    .font(.title)
            }
            Spacer()
        }
        .modifier(DetailedBoxViewMod())
    }
    
    private var longitude: some View {
        VStack {
            HStack {
                Image(systemName: "mappin")
                Text("Longitude")
            }
            .modifier(DetailedTitleViewMod())
            Spacer()
            HStack {
                Text("\(viewmodel.lon, specifier: "%. 2f")\u{00B0}")
                    .font(.title)
            }
            Spacer()
        }
        .modifier(DetailedBoxViewMod())
    }
    
    private var temp: some View {
        VStack {
            HStack {
                Image(systemName: "thermometer")
                Text("Temperature")
            }
            .modifier(DetailedLongTitleViewMod())
            Spacer()
            HStack {
                Text("\(viewmodel.temp, specifier: "%. 0f")\u{00B0}")
                    .font(.title)
            }
            Spacer()
        }
        .modifier(DetailedBoxViewMod())
    }
    
    private var feelsLike: some View {
        VStack {
            HStack {
                Image(systemName: "thermometer")
                Text("Feels Like")
            }
            .modifier(DetailedTitleViewMod())
            Spacer()
            HStack {
                Text("\(viewmodel.feelsLike, specifier: "%. 0f")\u{00B0}")
                    .font(.title)
            }
            Spacer()
        }
        .modifier(DetailedBoxViewMod())
    }
    
    private var sunrise: some View {
        VStack {
            HStack {
                Image(systemName: "sunrise")
                Text("Sunrise")
            }
            .modifier(DetailedTitleViewMod())
            Spacer()
            HStack {
                Text("\(viewmodel.currentSunrise) am")
                    .font(.title)
            }
            Spacer()
        }
        .modifier(DetailedBoxViewMod())
    }
    
    private var sunset: some View {
        VStack {
            HStack {
                Image(systemName: "sunset")
                Text("Sunset")
            }
            .modifier(DetailedTitleViewMod())
            Spacer()
            HStack {
                Text("\(viewmodel.currentSunset) pm")
                    .font(.title)
            }
            Spacer()
        }
        .modifier(DetailedBoxViewMod())
    }
    
    private var humidity: some View {
        VStack {
            HStack {
                Image(systemName: "humidity")
                
                Text("Humidity")
            }
            .modifier(DetailedTitleViewMod())
            Spacer()
            HStack {
                Text("\(viewmodel.humidity)%")
                    .font(.title)
            }
            Spacer()
        }
        .modifier(DetailedBoxViewMod())
    }
    
    private var pressure: some View {
        VStack {
            HStack {
                Image(systemName: "gauge")
                Text("Pressure")
            }
            .modifier(DetailedTitleViewMod())
            Spacer()
            HStack {
                Text("\(viewmodel.pressure)")
                    .font(.title)
            }
            Spacer()
        }
        .modifier(DetailedBoxViewMod())
    }
    
    private var dewPoint: some View {
        VStack {
            HStack {
                Image(systemName: "drop")
                Text("Dew Point")
            }
            .modifier(DetailedTitleViewMod())
            Spacer()
            HStack {
                Text("\(viewmodel.dewPoint, specifier: "%. 0f")")
                    .font(.title)
            }
            Spacer()
        }
        .modifier(DetailedBoxViewMod())
    }
    
    private var uvi: some View {
        VStack {
            HStack {
                Image(systemName: "sun.min")
                Text("UV Index")
            }
            .modifier(DetailedTitleViewMod())
            
            Spacer()
            HStack {
                Text("\(viewmodel.uvi, specifier: "%. 0f")")
                    .font(.title)
            }
            Spacer()
        }
        .modifier(DetailedBoxViewMod())
    }
    
    private var cloudiness: some View {
        VStack {
            HStack {
                Image(systemName: "cloud")
                Text("Cloudiness")
            }
            .modifier(DetailedLongTitleViewMod())
            Spacer()
            HStack {
                Text("\(viewmodel.clouds)%")
                    .font(.title)
            }
            Spacer()
        }
        .modifier(DetailedBoxViewMod())
    }
    
    private var visibilty: some View {
        VStack {
            HStack {
                
                Image(systemName: "eye")
                Text("Visibilty")
            }
            .modifier(DetailedTitleViewMod())
            Spacer()
            HStack {
                Text("\(viewmodel.visibilty) m")
                    .font(.title3)
            }
            Spacer()
        }
        .modifier(DetailedBoxViewMod())
    }
    
    private var windSpeed: some View {
        VStack {
            HStack {
                Image(systemName: "wind")
                Text("Wind Speed")
            }
            .modifier(DetailedLongTitleViewMod())
            Spacer()
            HStack {
                Text("\(viewmodel.windSpeed, specifier: "%. 1f") mph")
                    .font(.title2)
            }
            Spacer()
        }
        .modifier(DetailedBoxViewMod())
    }
    
    private var windDirection: some View {
        VStack {
            HStack {
                Image(systemName: "wind")
                    .padding(.leading, 10)
                Text("Wind Degree")
            }
            .modifier(DetailedLongTitleViewMod())
            Spacer()
            HStack {
                Text("\(viewmodel.windDeg)\u{00B0}")
                    .font(.title)
            }
            Spacer()
        }
        .modifier(DetailedBoxViewMod())
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(viewmodel: DetailedViewModel(party: Party(partyName: "Tony's Soiree", latitude: 40.670, longitude: -73.940)))
    }
}

// MARK: - VIEW MODIFIERS FOR DATA

struct DetailedBoxViewMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption.bold())
            .padding()
            .frame(width: 165, height: 100)
            .overlay(
                RoundedRectangle(cornerRadius: 9)
                    .stroke(Color.purple, lineWidth: 2.5))
            .background(
                .regularMaterial,
                in: RoundedRectangle(cornerRadius: 9, style: .continuous))
    }
}

struct DetailedTitleViewMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .foregroundStyle(.gray)
            .offset(x: -30, y: -7)
            .frame(alignment: .topLeading)
    }
}

struct DetailedShortTitleViewMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .foregroundStyle(.gray)
            .offset(x: -45, y: -7)
            .frame(alignment: .topLeading)
    }
}

struct DetailedLongTitleViewMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .foregroundStyle(.gray)
            .offset(x: -20, y: -7)
            .frame(alignment: .topLeading)
    }
}


