//
//  controllerImmersive.swift
//  MegazordApp
//
//  Created by Caio Gomes Piteli on 26/03/24.
//

import Foundation

enum RobotStatus {
    case idle
    case stuck
    case moving
    case off
}

class RobotController: ObservableObject{
    
    private var robot = Robot.chassis
    @Published var initialPosition: SIMD3<Float>?
    @Published var isRobotInInitialPosition = true
    @Published var selectedWheelID = 0
    @Published var selectedMotorID = 0

    
    /// Holds the current `RobotStatus`.
    @Published var robotStatus: RobotStatus = .off
    
    
        
        
        func decideRobotNewCase() {
            
            
            switch (selectedWheelID, selectedMotorID) {
            case(0,0):
                robot = Robot.chassis
            case(0,1):
                robot = Robot.motorOnly
            case(0,2):
                robot = Robot.twoMotors
            case(1,0):
                robot = Robot.defaultWheelsNoMotor
            case(1,1):
                robot = Robot.defaultWheelsMotor
            case(1,2):
                robot = Robot.defaultWheelsTwoMotors
            case(2,0):
                robot = Robot.bigWheelsNoMotor
            case(2,1):
                robot = Robot.bigWheelsMotor
            case(2,2):
                robot = Robot.bigWheelsTwoMotors
            case (_,_):
                robot = Robot.chassis
            }
        }
    
    func robotModelName() -> String{
        return robot.Model3D()
    }
    
    func applyPhysics() -> RobotPhysicsModel{
        return robot.GetPhysics()
    }
    
    //MARK: - Functions created to return a bool used for enabling or disabling models on the scene
    func checkDefaultWheelsMotor() -> Bool{
        robot == Robot.defaultWheelsMotor
    }
    
    func checkDefaultWheelsTwoMotors() -> Bool{
        robot == Robot.defaultWheelsTwoMotors
     
    }
    
    func checkDefaultWheelsNoMotor() -> Bool{
        robot == Robot.defaultWheelsNoMotor
     
    }
    
    func checkBigWheelsMotor() -> Bool{
        robot == Robot.bigWheelsMotor
       
    }
    
    func checkBigWheelsTwoMotors() -> Bool{
        robot == Robot.bigWheelsTwoMotors
         
    }
    
    func checkBigWheelsNoMotor() -> Bool{
        robot == Robot.bigWheelsNoMotor
         
    }
    
    func checkMotorOnly() -> Bool{
        robot == Robot.motorOnly
      
    }
    
    func checkTwoMotors() -> Bool{
        robot == Robot.twoMotors
        
    }
    
    func checkChassisOnly() -> Bool{
        robot == Robot.chassis
        
    }
    
    

}

