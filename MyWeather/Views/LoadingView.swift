//
//  LoadingView.swift
//  MyWeather
//
//  Created by Nilton Pontes on 26/09/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white)).frame(maxWidth: .infinity, maxHeight: .infinity).controlSize(.large)
    }
}

#Preview {
    LoadingView()
}
