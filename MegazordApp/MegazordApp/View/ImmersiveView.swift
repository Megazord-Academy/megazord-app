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
            if let scene = try? await Entity(named: sceneController.actualScene, in: realityKitContentBundle) {
                
                //MARK: - Accessing 3D models on the scene and changing
                if let defaultWheelsMotorCar = scene.findEntity(named: "car_normalWheels_motor") {
                    defaultWheelsMotorCar.isEnabled = robotController.checkDefaultWheelsMotor()
                }else{
                    print("Didn't find big wheels car") //Needed to throw error
                }
                
                if let defaultWheelsNoMotorCar = scene.findEntity(named: "Nome modelo com roda normal e sem motor") {
                    defaultWheelsNoMotorCar.isEnabled = robotController.checkBigWheelsNoMotor()
                }else{
                    print("Didn't find default wheels no motor car") //Needed to throw error
                }
                
                if let bigWheelsMotorCar = scene.findEntity(named: "car_bigWheels_motor") {
                    bigWheelsMotorCar.isEnabled = robotController.checkBigWheelsMotor()
                }else{
                    print("Didn't find big wheels car") //Needed to throw error
                }
                
                if let bigWheelsNoMotorCar = scene.findEntity(named: "Nome modelo com roda grande e sem motor") {
                    bigWheelsNoMotorCar.isEnabled = robotController.checkBigWheelsNoMotor()
                }else{
                    print("Didn't find big wheels no motor car") //Needed to throw error
                }
                
                if let onlyMotor = scene.findEntity(named: "Nome modelo apenas chassi e motor") {
                    onlyMotor.isEnabled = robotController.checkMotorOnly()
                }else{
                    print("Didn't find only motor car") //Needed to throw error
                }
                
                if let chassisOnly = scene.findEntity(named: "Nome modelo apenas chassi") {
                    chassisOnly.isEnabled = robotController.checkChassisOnly()
                }else{
                    print("Didn't find only chassis") //Needed to throw error
                }
                
                
                
                
                content.add(scene)
            }
            
        }
    }
}
