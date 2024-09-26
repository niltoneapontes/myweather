//
//  ContentView.swift
//  MyWeather
//
//  Created by Nilton Pontes on 26/09/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                Text("Your coordinates are: \(location.longitude), \(location.latitude)")
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView().environmentObject(locationManager)
                }
            }
        }.background(Color(hue: 0.57, saturation: 1.0, brightness: 0.666))
    }
}

#Preview {
    ContentView()
}
