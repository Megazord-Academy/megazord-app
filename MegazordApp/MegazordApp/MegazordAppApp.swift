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
    @ObservedObject var sceneController = SceneController()

    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(robotController)
                .environmentObject(sceneController)
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
                .environmentObject(robotController)
                .environmentObject(sceneController)
        }
        
        ImmersiveSpace(id: "EditRobotImmersive") {
            EditRobotImmersive()
                .environmentObject(robotController)
                .environmentObject(sceneController)
        }
        
        ImmersiveSpace(id: "RampLesson") {
            RampLessonImmersive()
                .environmentObject(robotController)
                .environmentObject(sceneController)
        }
        
        WindowGroup(id: "EditRobot"){
            EditRobot()
                .environmentObject(robotController)
                .environmentObject(sceneController)
                
        }.defaultSize(width: 880, height: 900/*, depth: 3, in:.meters*/)
    }
}


