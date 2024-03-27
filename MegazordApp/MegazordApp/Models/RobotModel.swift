//
//  RobotModel.swift
//  MegazordApp
//
//  Created by Caio Gomes Piteli on 26/03/24.
//

import Foundation

enum Robot {
    case defaultWheelsMotor
    case defaultWheelsTwoMotors
    case defaultWheelsNoMotor
    case bigWheelsMotor
    case bigWheelsTwoMotors
    case bigWheelsNoMotor
    case motorOnly
    case twoMotors
    case chassis
    
    //Function to selcte wich 3D model to load. Will be Used to stop stacking 3D Models on RealityComposer
    func Model3D() -> String {
        switch self {
        case .defaultWheelsMotor:
            return "car-normalWheels-motor"
        case .defaultWheelsTwoMotors:
            return "Scene"
        case .defaultWheelsNoMotor:
            return "Scene"
        case .bigWheelsMotor:
            return "car-bigWheels-motor.usdz"
        case .bigWheelsNoMotor:
            return "Scene"
        case .bigWheelsTwoMotors:
            return "Scene"
        case .motorOnly:
            return "Scene"
        case .twoMotors:
            return "Scene"
        case .chassis:
            return "Scene"
        }
    }
    
    func ShouldApplyForce() -> Bool {
        switch self {
        case .defaultWheelsMotor:
            return true
        case .defaultWheelsNoMotor:
            return false
        case .defaultWheelsTwoMotors:
            return true
        case .bigWheelsMotor:
            return true
        case .bigWheelsNoMotor:
            return false
        case .bigWheelsTwoMotors:
            return true
        case .motorOnly:
            return false
        case .twoMotors:
            return false
        case .chassis:
            return false
        }
    }
}
