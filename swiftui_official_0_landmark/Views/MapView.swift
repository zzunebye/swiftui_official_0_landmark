//
//  MapView.swift
//  swiftui_official_0_landmark
//
//  Created by June on 18/6/2023.
//

import SwiftUI
import MapKit // to import a framework to gain access to map functionality

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    /// @State attribute to establish a source of truth for data in your app that you can modify from more than one view. The view will be automatically updated when value changes
    @State private var region = MKCoordinateRegion()
    
    /// '$' indicates a binding. This means the reference to a state value is two-way binded to the value of UI. This is impelmented with a @binding property wrapper,
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear{
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
