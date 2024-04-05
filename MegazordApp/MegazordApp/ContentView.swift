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
    /// Router for managing navigation paths
    @EnvironmentObject var router: Router
    @EnvironmentObject var sceneController: SceneController
    
    var body: some View {
        NavigationStack(path: $router.path) {
            LessonSelectionView()
            .onAppear{
                if sceneController.simulatorStatus != .closed {
                    sceneController.simulatorStatus = .closed
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
