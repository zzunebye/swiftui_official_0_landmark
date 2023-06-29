//
//  Landmark.swift
//  swiftui_official_0_landmark
//
//  Created by June on 18/6/2023.
//

import Foundation
import SwiftUI
import CoreLocation

/// Codable is a protocol in Swift that allows us to encode and decode types (structs or classes) into JSON, XML, or any other format. By implementing the Codable protocol, we are able to easily convert the data types in our apps to these different formats, which is especially useful when communicating with APIs or storing data.
/// Identifiable makes the item unique by nature, such as the `id` doesn't have to be passed to `List` view
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    /// DataType defined in CoreLocation to interact with the MapKit framework
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
