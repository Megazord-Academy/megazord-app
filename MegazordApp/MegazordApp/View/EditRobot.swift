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
    
    
    var body: some View {
        VStack{
            Spacer()
            
            HStack{
                
                Spacer()
                
                Button("BigWheels"){
                    robotController.putBigWheels()
                }
                
                Button("DefaultWheels"){
                    robotController.putDefaultWheels()
                }
                
                Button("Motor"){
                    robotController.putMotor()
                }
                
                Spacer()
            }
            
            Spacer()
        }.glassBackgroundEffect()
    }
}
