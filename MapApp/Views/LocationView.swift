//
//  LocationView.swift
//  MapApp
//
//  Created by Marcin Wawer on 07-08-2024.
//

import SwiftUI
import MapKit

struct LocationView: View {
    
    @EnvironmentObject private var locationsViemModel: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(position: $locationsViemModel.mapRegion)
//                .animation(.easeInOut, value: locationsViemModel.mapRegion)
        }
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationsViewModel())
}
