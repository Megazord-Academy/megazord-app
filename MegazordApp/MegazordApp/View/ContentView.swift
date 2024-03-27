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
    @EnvironmentObject var sceneController: SceneController


    @State private var showImmersiveSpace = false  
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        VStack {
            
            Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
                .font(.title)
                .frame(width: 360)
                .padding(24)
                .glassBackgroundEffect()
            
            Button("Edit Robot Scene"){
                sceneController.actualScene = "EditRobot"
            }.padding()
            
            Button("First Lesson Scene"){
                sceneController.actualScene = "Immersive"
            }.padding()
            
            Button("Second Lesson Scene"){
                sceneController.actualScene = "RampLesson"
            }.padding()
            
            Button("Edit Robot"){
                openWindow(id: "EditRobot")
            }.padding()
            
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
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
