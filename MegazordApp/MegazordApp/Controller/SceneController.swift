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
        if let defaultWheelsMotorCar = scene.findEntity(named: Robot.defaultWheelsMotor.Model3D()) {
            defaultWheelsMotorCar.isEnabled = robotController.checkDefaultWheelsMotor()
        }else{
            print("Didn't find normal wheels car") //Needed to throw error
        }
        
        if let defaultWheelsNoMotorCar = scene.findEntity(named: Robot.defaultWheelsNoMotor.Model3D()) {
            defaultWheelsNoMotorCar.isEnabled = robotController.checkDefaultWheelsNoMotor()
        }else{
            print("Didn't find default wheels no motor car") //Needed to throw error
        }
        
        if let bigWheelsMotorCar = scene.findEntity(named: Robot.bigWheelsMotor.Model3D()) {
            bigWheelsMotorCar.isEnabled = robotController.checkBigWheelsMotor()
        }else{
            print("Didn't find big wheels car") //Needed to throw error
        }
        
        if let bigWheelsNoMotorCar = scene.findEntity(named: Robot.bigWheelsNoMotor.Model3D()) {
            bigWheelsNoMotorCar.isEnabled = robotController.checkBigWheelsNoMotor()
        }else{
            print("Didn't find big wheels no motor car") //Needed to throw error
        }
        
        if let onlyMotor = scene.findEntity(named: Robot.motorOnly.Model3D()) {
            onlyMotor.isEnabled = robotController.checkMotorOnly()
        }else{
            print("Didn't find only motor car") //Needed to throw error
        }
        
        if let chassisOnly = scene.findEntity(named: Robot.chassis.Model3D()) {
            chassisOnly.isEnabled = robotController.checkChassisOnly()
        }else{
            print("Didn't find only chassis") //Needed to throw error
        }
        
        if let bigWheelsTwoMotorCar = scene.findEntity(named: Robot.bigWheelsTwoMotors.Model3D()) {
            bigWheelsTwoMotorCar.isEnabled = robotController.checkBigWheelsTwoMotors()
        }else{
            print("Didn't find big wheels two motors") //Needed to throw error
        }
        
        if let defaultWheelsTwoMotorCar = scene.findEntity(named: Robot.defaultWheelsTwoMotors.Model3D()) {
            defaultWheelsTwoMotorCar.isEnabled = robotController.checkDefaultWheelsTwoMotors()
        }else{
            print("Didn't find default wheels two motors") //Needed to throw error
        }
        
        if let twoMotors = scene.findEntity(named: Robot.twoMotors.Model3D()) {
            twoMotors.isEnabled = robotController.checkTwoMotors()
        }else{
            print("Didn't find two motors car") //Needed to throw error
        }
    }

}

