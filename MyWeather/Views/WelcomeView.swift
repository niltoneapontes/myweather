//
//  WelcomeView.swift
//  MyWeather
//
//  Created by Nilton Pontes on 26/09/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Boas-vindas ao MyWeather").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding()
                Text("Compartilhe a sua localização para começar").font(.subheadline).padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }.cornerRadius(30)
                .symbolVariant(.fill)
                .foregroundColor(.white)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
