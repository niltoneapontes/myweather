//
//  WeatherView.swift
//  MyWeather
//
//  Created by Nilton Pontes on 26/09/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name).bold().font(.title)
                    Text("Hoje: \(Date().formatted(.dateTime.month().day().hour().minute().locale( Locale(identifier: "pt-BR"))))").fontWeight(.light)
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                            Image(systemName: "cloud")
                                .font(.system(size: 80))
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°C").font(.system(size: 80)).bold().padding()
                    }
                    
                    AsyncImage(url: URL(string: "https://png.pngtree.com/png-vector/20231221/ourmid/pngtree-3d-earth-globe-design-png-image_11375798.png")) {
                        image in image.image?.resizable().aspectRatio(contentMode: .fit)
                    }.padding(.bottom)
                    
                    Spacer()
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }.padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Como está o tempo").bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Temp. mín.", value: (weather.main.tempMin.roundDouble() + "°C"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Temp. máx.", value: (weather.main.tempMax.roundDouble() + "°C"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Vel. vento", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Umidade", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                }.frame(maxWidth: .infinity, alignment: .leading).padding().padding(.bottom, 20)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .background(.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }.edgesIgnoringSafeArea(.bottom)
            .background(Color(hue: 0.57, saturation: 1.0, brightness: 0.666))
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
