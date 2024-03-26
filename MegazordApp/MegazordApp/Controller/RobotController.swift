//
//  controllerImmersive.swift
//  MegazordApp
//
//  Created by Caio Gomes Piteli on 26/03/24.
//

import Foundation

class RobotController: ObservableObject{
    private var defaultWheelSelected = false
    private var motorSelected = false
    private var bigWheelSelected = false
    private var robot = Robot.chassis
    
    func putBigWheels(){
        if defaultWheelSelected{
            defaultWheelSelected = false
            bigWheelSelected.toggle()
        }else{
            bigWheelSelected.toggle()
        }
        
        decideRobotNewCase()
    }
    
    func putDefaultWheels(){
        if bigWheelSelected{
            bigWheelSelected = false
            defaultWheelSelected.toggle()
        }else{
            defaultWheelSelected.toggle()
        }
        
        decideRobotNewCase()
    }
    
    func putMotor(){
        motorSelected.toggle()
    }
    
    func decideRobotNewCase(){
        if defaultWheelSelected && motorSelected{
            robot = Robot.defaultWheelsMotor
        }else if defaultWheelSelected{
            robot = Robot.defaultWheelsNoMotor
        }else if bigWheelSelected && motorSelected{
            robot = Robot.bigWheelsMotor
        }else if bigWheelSelected{
            robot = Robot.bigWheelsNoMotor
        }else if motorSelected{
            robot = Robot.motorOnly
        }else{
            robot = Robot.chassis
        }
    }
    
    func checkDefaultWheelsMotor() -> Bool{
        if robot == Robot.defaultWheelsMotor{
            return true
        }else{
            return false
        }
    }
    
    func checkDefaultWheelsNoMotor() -> Bool{
        if robot == Robot.defaultWheelsNoMotor{
            return true
        }else{
            return false
        }
    }
    
    func checkBigWheelsMotor() -> Bool{
        if robot == Robot.bigWheelsMotor{
            return true
        }else{
            return false
        }
    }
    
    func checkBigWheelsNoMotor() -> Bool{
        if robot == Robot.bigWheelsNoMotor{
            return true
        }else{
            return false
        }
    }
    
    func checkMotorOnly() -> Bool{
        if robot == Robot.motorOnly{
            return true
        }else{
            return false
        }
    }
    
    func checkChassisOnly() -> Bool{
        if robot == Robot.chassis{
            return true
        }else{
            return false
        }
    }

}

