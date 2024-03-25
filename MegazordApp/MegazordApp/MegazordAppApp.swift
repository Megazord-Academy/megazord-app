//
//  MegazordAppApp.swift
//  MegazordApp
//
//  Created by Bruno Dias on 25/03/24.
//

import SwiftUI

@main
struct MegazordAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
