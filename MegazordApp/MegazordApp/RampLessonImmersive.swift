//
//  RampLessonImmersive.swift
//  MegazordApp
//
//  Created by Caio Gomes Piteli on 27/03/24.
//

import SwiftUI

import SwiftUI
import RealityKit
import RealityKitContent

struct RampLessonImmersive: View {
    @EnvironmentObject var robotController: RobotController
    @EnvironmentObject var sceneController: SceneController
    
    var body: some View {
        RealityView { content in
    
            // Loading scene
            if let scene = try? await Entity(named: "mundoRampa", in: realityKitContentBundle) {
                
                sceneController.decideRobot(scene: scene, robotController: robotController)
                
                content.add(scene)
            }
            
        }
    }
}
