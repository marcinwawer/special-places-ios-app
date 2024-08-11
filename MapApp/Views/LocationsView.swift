//
//  LocationsView.swift
//  MapApp
//
//  Created by Marcin Wawer on 07-08-2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var locationsViewModel: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(position: $locationsViewModel.mapRegion)
//                .animation(.easeInOut, value: locationsViemModel.mapRegion)
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
            }
        }
    }
}


#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    private var header: some View {
        VStack {
            Button(action: locationsViewModel.toggleLocationsList, label: {
                Text(locationsViewModel.mapLocation.name + ", " + locationsViewModel.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(Color.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: locationsViewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(Color.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: locationsViewModel.showLocationsList ? 180 : 0))
                    }
            })
            
            if locationsViewModel.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(
            color: .black.opacity(0.3),
            radius: 20,
            x: 0,
            y: 15
        )
    }
}
