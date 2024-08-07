//
//  LocationView.swift
//  MapApp
//
//  Created by Marcin Wawer on 07-08-2024.
//

import SwiftUI

struct LocationView: View {
    
    @EnvironmentObject private var locationsViemModel: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(locationsViemModel.locations) {
                Text($0.name)
            }
        }
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationsViewModel())
}
