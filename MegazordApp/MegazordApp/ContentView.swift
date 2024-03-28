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
    var body: some View {
        NavigationStack {
            TutorialLessonView()
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
