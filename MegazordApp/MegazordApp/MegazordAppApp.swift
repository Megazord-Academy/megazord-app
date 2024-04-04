//
//  MegazordAppApp.swift
//  MegazordApp
//
//  Created by Bruno Dias on 25/03/24.
//

import SwiftUI

@main
struct MegazordAppApp: App {
    @ObservedObject var robotController = RobotController()
    @StateObject var router = Router()
    @ObservedObject var sceneController = SceneController()

    var body: some Scene {
        /// The app's main window
        WindowGroup {
            ContentView()
                .environmentObject(robotController)
                .environmentObject(router)
                .environmentObject(sceneController)
        }
        
        /// Robot editor immersive space
        ImmersiveSpace(id: "EditRobotImmersive") {
            EditRobotImmersive()
                .environmentObject(robotController)
                .environmentObject(sceneController)
        }
        
        /// Tutorial lesson immersive space
        ImmersiveSpace(id: "ImmersiveSpace") {
            SimulatorView(immersiveName: "Immersive")
                .environmentObject(robotController)
                .environmentObject(sceneController)
        }
        
        /// Second lesson immersive space
        ImmersiveSpace(id: "RampLesson") {
            SimulatorView(immersiveName: "mundoRampa")
                .environmentObject(robotController)
                .environmentObject(sceneController)
        }
    }
}


