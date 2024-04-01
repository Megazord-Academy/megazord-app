//
//  SceneController.swift
//  MegazordApp
//
//  Created by Caio Gomes Piteli on 26/03/24.
//

import Foundation
import RealityKit

enum SimulatorStatus {
    case closed
    case open
    case running
}

class SceneController: ObservableObject{
    
    //MARK: - These variables are responsible for showing the right scene on the lesson screen
    @Published var showFirstLessonImmersive = false
    @Published var firstLessonIsShown = false
    
    @Published var showEditRobotImmersive = false
    @Published var editRobotImmersiveIsShown = false
    
    /// Holds the status of the simulator.
    @Published var simulatorStatus: SimulatorStatus = .closed
    
    @Published var levelCompleted: Bool = false

    
    /// This function is responsible for searching 3D Robot models on the current scene created on the RealityComposerPro and making only the right robot (created by user) to appear on the scene, by enabling it and disabling others.
    ///
    /// This function relates to the decidion made on the team to stack all the robots on the scene and only showing the right one.
    func decideRobot(scene: Entity, robotController: RobotController){
        
        if let defaultWheelsMotorCar = scene.findEntity(named: Robot.defaultWheelsMotor.Model3D()) {
            defaultWheelsMotorCar.isEnabled = robotController.checkDefaultWheelsMotor()
        }else{
            print("Didn't find default wheels car") //Needed to throw error
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

