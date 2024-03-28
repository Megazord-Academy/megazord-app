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
    
    func Model3D() -> String {
        switch self {
        case .defaultWheelsMotor:
            return "car_normalWheels_motor"
        case .defaultWheelsTwoMotors:
            return "car_normalWheels_dualMotor"
        case .defaultWheelsNoMotor:
            return "car_normalWheels"
        case .bigWheelsMotor:
            return "car_bigWheels_motor"
        case .bigWheelsNoMotor:
            return "car_bigWheels"
        case .bigWheelsTwoMotors:
            return "car_bigWheels_dualMotor"
        case .motorOnly:
            return "car_motor"
        case .twoMotors:
            return "car_dualMotor"
        case .chassis:
            return "car"
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
