//
//  ContentView.swift
//  swiftui_official_0_landmark
//
//  Created by June on 18/6/2023.
//

import SwiftUI

struct ContentView: View {
    
    // body property should only return a single view. multiple views should be combined by stacks
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
        /// A preview fails if any subview requires a model object in the environment, but the view you are previewing doesn’t have the environmentObject(_:) modifier.
    }
}
