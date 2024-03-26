//
//  MegazordAppApp.swift
//  MegazordApp
//
//  Created by Bruno Dias on 25/03/24.
//

import SwiftUI

@main
struct MegazordAppApp: App {
    @ObservedObject var helper = Helper()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(helper)
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
                .environmentObject(helper)
        }
        
        
        WindowGroup(id: "EditRobot"){
            EditRobot()
        }
    }
}


