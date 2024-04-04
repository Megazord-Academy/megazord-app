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
                
                NavigationLink(value: "RampLesson") {
                    Text("Friction")
                }
                
                Spacer()
                
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
