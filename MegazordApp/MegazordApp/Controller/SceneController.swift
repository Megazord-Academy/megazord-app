//
//  SceneController.swift
//  MegazordApp
//
//  Created by Caio Gomes Piteli on 26/03/24.
//

import Foundation
import RealityKit

class SceneController: ObservableObject{
    @Published var showFirstLessonImmersive = false
    @Published var firstLessonIsShown = false
    
    @Published var showEditRobotImmersive = false
    @Published var editRobotImmersiveIsShown = false
    
    @Published var showRampLesson = false
    @Published var rampLessonIsShown = false
    
    func decideRobot(scene: Entity, robotController: RobotController){
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
        
        if let bigWheelsTwoMotorCar = scene.findEntity(named: "Nome modelo de roda grande e dois motores") {
            bigWheelsTwoMotorCar.isEnabled = robotController.checkBigWheelsTwoMotors()
        }else{
            print("Didn't find big wheels two motors") //Needed to throw error
        }
        
        if let defaultWheelsTwoMotorCar = scene.findEntity(named: "Nome modelo de roda normal e dois motores") {
            defaultWheelsTwoMotorCar.isEnabled = robotController.checkDefaultWheelsTwoMotors()
        }else{
            print("Didn't find default wheels two motors") //Needed to throw error
        }
        
        if let twoMotors = scene.findEntity(named: "Nome modelo com dois motores") {
            twoMotors.isEnabled = robotController.checkTwoMotors()
        }else{
            print("Didn't find two motors car") //Needed to throw error
        }
    }

}

