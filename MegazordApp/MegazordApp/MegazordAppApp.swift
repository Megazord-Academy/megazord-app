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
    @ObservedObject var viewModel = TutorialLessonViewModel(lessonName: "Tutorial Lesson", simulatorCardText: "You need to launch the simulator in order to test your robot.")

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(robotController)
                .environmentObject(router)
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
    }
}


