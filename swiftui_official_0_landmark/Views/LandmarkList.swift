//
//  LandmarkList.swift
//  swiftui_official_0_landmark
//
//  Created by June on 19/6/2023.
//

import SwiftUI

struct LandmarkList: View {
    /// for an observable object supplied by a parent or ancestor view
    /// An environment object invalidates the current view whenever the object changes
    @EnvironmentObject var modelData: ModelData
    
    /// state properties to hold information that’s specific to a view and its subviews
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter {
            landmark in (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                /// binding acts as a reference to a mutable state
                /// $ prefix to access a binding to a state variable
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorite Only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (3rd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .environmentObject(ModelData())

        }
    }
}
