//
//  EditRobot.swift
//  MegazordApp
//
//  Created by Caio Gomes Piteli on 25/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct EditRobot: View {
    @EnvironmentObject var robotController: RobotController
    @EnvironmentObject var sceneController: SceneController
    
    
    var body: some View {
        VStack{
            Spacer()
            
            HStack{
                
                Spacer()
                
                Button("BigWheels"){
                    robotController.putBigWheels()
                    sceneController.showEditRobotImmersive = false
                }
                
                Button("DefaultWheels"){
                    robotController.putDefaultWheels()
                    sceneController.showEditRobotImmersive = false

                }
                
                Button("Motor"){
                    robotController.putMotor()
                    sceneController.showEditRobotImmersive = false

                }
                
                Spacer()
            }
            
            Spacer()
        }.glassBackgroundEffect()
    }
}
