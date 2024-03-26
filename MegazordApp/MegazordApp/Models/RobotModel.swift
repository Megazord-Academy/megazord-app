//
//  RobotModel.swift
//  MegazordApp
//
//  Created by Caio Gomes Piteli on 26/03/24.
//

import Foundation

enum Robot {
    case defaultWheelsMotor
    case defaultWheelsNoMotor
    case bigWheelsMotor
    case bigWheelsNoMotor
    case motorOnly
    case chassis
    
    //Function to selcte wich 3D model to load. Will be Used to stop stacking 3D Models on RealityComposer
    func Model3D() -> String {
        switch self {
        case .defaultWheelsMotor:
            return "car-normalWheels-motor"
        case .defaultWheelsNoMotor:
            return "Scene"
        case .bigWheelsMotor:
            return "car-bigWheels-motor.usdz"
        case .bigWheelsNoMotor:
            return "Scene"
        case .motorOnly:
            return "Scene"
        case .chassis:
            return "Scene"
        }
    }
}
