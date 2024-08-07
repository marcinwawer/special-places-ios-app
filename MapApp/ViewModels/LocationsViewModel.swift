//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Marcin Wawer on 07-08-2024.
//

import Foundation

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init() {
        locations = LocationsDataService.locations
    }
    
}
