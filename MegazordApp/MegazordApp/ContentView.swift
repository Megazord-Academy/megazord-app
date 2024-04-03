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
    @State private var lastButtonTapped = ButtonTapped.edit
    @State var firstInteractionOnScreen = true
    @EnvironmentObject var router: Router
    @EnvironmentObject var sceneController: SceneController
    @StateObject var viewModel = TutorialLessonViewModel(lessonName: "Tutorial Lesson", simulatorCardText: "You need to launch the simulator in order to test your robot.")

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                NavigationLink(value: "TutorialLesson") {
                    Text("Tutorial Lesson")
                }
                
                Button("First Lesson"){
                    openWindow(id: "Lesson") //It will become a sheet
                }.padding()
                
            }
            .navigationDestination(for: String.self) { value in
                switch value {
                    case "TutorialLesson":
                        LessonView()
                            .environmentObject(viewModel)
                        
                    default:
                        Text("Oh no! 404")
                }
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
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
