//
//  ImmersiveView.swift
//  MegazordApp
//
//  Created by Bruno Dias on 25/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    @EnvironmentObject var robotController: RobotController
    @EnvironmentObject var sceneController: SceneController
    
    var body: some View {
        RealityView { content in
    
            // Loading scene
            if let scene = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                
                sceneController.decideRobot(scene: scene, robotController: robotController)
                
                content.add(scene)
            }
            
        }
    }
}
