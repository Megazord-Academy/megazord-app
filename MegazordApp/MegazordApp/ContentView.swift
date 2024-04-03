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
            VStack(spacing: 64) {
                Spacer()
                
                HStack(spacing: 16) {
                    Image("prototypeIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 54)
                    
                    Text("Hoove")
                        .font(.extraLargeTitle)
                        .fontWeight(.bold)
                }
                
                NavigationLink(value: "TutorialLesson") {
                    Text("Tutorial Lesson")
                }
                
                Spacer()
                
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
        }
        
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
