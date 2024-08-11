//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Marcin Wawer on 07-08-2024.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
//    all loaded locations
    @Published var locations: [Location]
//    current location on the map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }

//    current region on map
    @Published var mapRegion = MapCameraPosition.region(MKCoordinateRegion())
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
//    show list of locations
    @Published var showLocationsList = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MapCameraPosition.region(MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
            ))
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("could not find current index in locations array, should never happen")
            return
        }
        
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else {
                return
            }
            showNextLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}

