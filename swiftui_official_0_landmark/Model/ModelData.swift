//
//  ModelData.swift
//  swiftui_official_0_landmark
//
//  Created by June on 19/6/2023.
//

import Foundation
import Combine

/// A custom object for your data that can be bound to a view from storage in SwiftUI’s environment
/// SwiftUI watches for any changes to observable objects
final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}

/// Before using ModelData - static data
var landmarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    /// locate the file with the given filename in the main bundle
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    /// If the file is found, the function attempts to load its contents into a ﻿Data object. If this operation fails, the function terminates with a fatal error.
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    /// If the file is successfully loaded, the function attempts to decode its contents using a ﻿JSONDecoder object. The decoded value is then returned as type ﻿T.

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch{
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}
