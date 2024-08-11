//
//  MapApp.swift
//  MapApp
//
//  Created by Marcin Wawer on 07-08-2024.
//

import SwiftUI

@main
struct MapApp: App {
    
    @StateObject private var locationsViewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(locationsViewModel)
        }
    }
}
