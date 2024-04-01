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
    
    func GetPhysics() -> RobotPhysicsModel {
        switch self {
        case .defaultWheelsMotor:
            return RobotPhysicsModel(force: SIMD3(x: 3.5, y: 0, z: 0), mass: 1.5)
        case .defaultWheelsNoMotor:
            return RobotPhysicsModel(force: SIMD3(x: 0, y: 0, z: 0), mass: 0.9)
        case .defaultWheelsTwoMotors:
            return RobotPhysicsModel(force: SIMD3(x: 6.5, y: 0, z: 0), mass: 2.1)
        case .bigWheelsMotor:
            return RobotPhysicsModel(force: SIMD3(x: 8.5, y: 0, z: 0), mass: 1.8)
        case .bigWheelsNoMotor:
            return RobotPhysicsModel(force: SIMD3(x: 0, y: 0, z: 0), mass: 1.2)
        case .bigWheelsTwoMotors:
            return RobotPhysicsModel(force: SIMD3(x: 11.5, y: 0, z: 0), mass: 2.4)
        case .motorOnly:
            return RobotPhysicsModel(force: SIMD3(x: 0, y: 0, z: 0), mass: 0.7)
        case .twoMotors:
            return RobotPhysicsModel(force: SIMD3(x: 0, y: 0, z: 0), mass: 1.3)
        case .chassis:
            return RobotPhysicsModel(force: SIMD3(x: 0, y: 0, z: 0), mass: 0.1)
        }
    }
}
