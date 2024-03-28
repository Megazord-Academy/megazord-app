//
//  ContentView.swift
//  MegazordApp
//
//  Created by Bruno Dias on 25/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var showImmersiveSpace = false 
    @State private var showImmersiveSpace1 = false

    @State private var immersiveSpaceIsShown = false
    @State private var immersiveSpaceIsShown1 = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    

    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Text("Hello, world!")

            Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
                .font(.title)
                .frame(width: 360)
                .padding(24)
                .glassBackgroundEffect()
            Toggle("Show mundoRampa", isOn: $showImmersiveSpace1)
                .font(.title)
                .frame(width: 360)
                .padding(24)
                .glassBackgroundEffect()
        }
        .padding()
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
            
        }
        .onChange(of: showImmersiveSpace1) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "MundoRampa") {
                    case .opened:
                        immersiveSpaceIsShown1 = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown1 = false
                        showImmersiveSpace1 = false
                    }
                } else if immersiveSpaceIsShown1 {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown1 = false
                }
            }
            
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
