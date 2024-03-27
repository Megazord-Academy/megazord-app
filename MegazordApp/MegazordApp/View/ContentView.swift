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
    
    @State private var tapped = "edit"
    @State var tapsMade = 0

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        VStack {
            
            Button("First Lesson Scene"){
                sceneController.showEditRobotImmersive = false
                sceneController.showRampLesson = false
                
                if tapsMade == 0{
                    sceneController.showFirstLessonImmersive = true
                    tapsMade = tapsMade + 1
                }
                
                tapped = "first"
               
            }.padding()
            
            Button("Edit Robot Scene"){
                sceneController.showFirstLessonImmersive = false
                sceneController.showRampLesson = false
                
                if tapsMade == 0{
                    sceneController.showEditRobotImmersive = true
                    tapsMade = tapsMade + 1
                }
                
                tapped = "edit"

            }.padding()
            
           
            Button("Second Lesson Scene"){
                sceneController.showFirstLessonImmersive = false
                sceneController.showEditRobotImmersive = false
                
                if tapsMade == 0{
                    sceneController.showRampLesson = true
                    tapsMade = tapsMade + 1
                }
                
                tapped = "ramp"
                
            }.padding()
            
            Button("Edit Robot"){
                openWindow(id: "EditRobot")
                
                sceneController.showFirstLessonImmersive = false
                sceneController.showRampLesson = false
                
                if tapsMade == 0{
                    sceneController.showEditRobotImmersive = true
                    tapsMade = tapsMade + 1
                }
                
                tapped = "edit"
                
            }.padding()
            
        }
        .onChange(of: sceneController.showFirstLessonImmersive) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        sceneController.firstLessonIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        sceneController.firstLessonIsShown = false
                        sceneController.showFirstLessonImmersive = false
                    }
                } else if sceneController.firstLessonIsShown {
                    await dismissImmersiveSpace()
                    
                    sceneController.firstLessonIsShown = false
                    
                    if tapped == "edit"{
                        if sceneController.firstLessonIsShown == false{
                            sceneController.showEditRobotImmersive = true
                        }
                    }else if tapped == "ramp"{
                        if sceneController.firstLessonIsShown == false{
                            sceneController.showRampLesson = true
                        }
                    }
                }
            }
        }
        
        .onChange(of: sceneController.showEditRobotImmersive) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "EditRobotImmersive") {
                    case .opened:
                        sceneController.editRobotImmersiveIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        sceneController.editRobotImmersiveIsShown = false
                        sceneController.showEditRobotImmersive = false
                    }
                } else if sceneController.editRobotImmersiveIsShown {
                    await dismissImmersiveSpace()
                    
                    sceneController.editRobotImmersiveIsShown = false
                    
                    if tapped == "first"{
                        if sceneController.editRobotImmersiveIsShown == false{
                            sceneController.showFirstLessonImmersive = true
                        }
                    }else if tapped == "ramp"{
                        if sceneController.editRobotImmersiveIsShown == false{
                            sceneController.showRampLesson = true
                        }
                    }else{
                        sceneController.showEditRobotImmersive = true
                    }
                }
            }
        }
        .onChange(of: sceneController.showRampLesson) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "RampLesson") {
                    case .opened:
                        sceneController.showRampLesson = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        sceneController.rampLessonIsShown = false
                        sceneController.showRampLesson = false
                    }
                } else if sceneController.rampLessonIsShown {
                    await dismissImmersiveSpace()
                    
                    sceneController.rampLessonIsShown = false
                    
                    if tapped == "first"{
                        if sceneController.rampLessonIsShown == false{
                            sceneController.showFirstLessonImmersive = true
                        }
                    }else if tapped == "edit"{
                        if sceneController.rampLessonIsShown == false{
                            sceneController.showEditRobotImmersive = true
                        }
                    }
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
