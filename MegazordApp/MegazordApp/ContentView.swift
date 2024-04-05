//
//  ContentView.swift
//  MegazordApp
//
//  Created by Bruno Dias on 25/03/24.
//

import SwiftData
import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    /// Router for managing navigation paths
    @EnvironmentObject var router: Router
    @EnvironmentObject var robotController: RobotController
    @EnvironmentObject var sceneController: SceneController
    @Query var savedRobot: [SDRobot]
    
    var body: some View {
        NavigationStack(path: $router.path) {
            LessonSelectionView()
            .onAppear{
                if sceneController.simulatorStatus != .closed {
                    sceneController.simulatorStatus = .closed
                }
                
                if let robot = savedRobot.first {
                    robotController.selectedMotorID = robot.selectedMotorID
                    robotController.selectedWheelID = robot.selectedWheelID
                }
                
            }
            .navigationDestination(for: String.self) { value in
                switch value {
                    case "TutorialLesson":
                        TutorialLessonView()
                        
                    case "RampLesson":
                        RampLessonView()
                        
                    default:
                        Text("Oh no! 404")
                }
            }
        }
        
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
