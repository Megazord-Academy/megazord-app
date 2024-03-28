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
    
    @State private var lastButtonTapped = ButtonTapped.edit
    @State var firstInteractionOnScreen = true

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        VStack {
            
            Button("First Lesson Scene"){
                sceneController.showEditRobotImmersive = false
                
                if firstInteractionOnScreen{
                    sceneController.showFirstLessonImmersive = true
                    firstInteractionOnScreen = false
                }
                
                lastButtonTapped = ButtonTapped.lesson
               
            }.padding()
            
            Button("Edit Robot"){
                openWindow(id: "EditRobot") //It will become a sheet
                
                sceneController.showFirstLessonImmersive = false
                
                if firstInteractionOnScreen{
                    sceneController.showEditRobotImmersive = true
                    firstInteractionOnScreen = false
                }
                
                lastButtonTapped = ButtonTapped.edit
                
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
                    
                    if lastButtonTapped == ButtonTapped.edit{
                        if sceneController.firstLessonIsShown == false{
                            sceneController.showEditRobotImmersive = true
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
                    
                    if lastButtonTapped == ButtonTapped.lesson{
                        if sceneController.editRobotImmersiveIsShown == false{
                            sceneController.showFirstLessonImmersive = true
                        }
                    }else{
                        sceneController.showEditRobotImmersive = true
                    }
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
