//
//  controllerImmersive.swift
//  MegazordApp
//
//  Created by Caio Gomes Piteli on 26/03/24.
//

import Foundation

class RobotController: ObservableObject{
    private var defaultWheelSelected = false
    private var numMotorsSelected = 0
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
        numMotorsSelected = numMotorsSelected + 1
        if numMotorsSelected > 2{
            numMotorsSelected = 0
        }
        decideRobotNewCase()
    }
    
    func decideRobotNewCase(){
        if defaultWheelSelected && numMotorsSelected == 1{
            robot = Robot.defaultWheelsMotor
        }else if defaultWheelSelected{
            robot = Robot.defaultWheelsNoMotor
        }else if defaultWheelSelected && numMotorsSelected == 2{
            robot = Robot.defaultWheelsTwoMotors
        }else if bigWheelSelected && numMotorsSelected == 1{
            robot = Robot.bigWheelsMotor
        }else if bigWheelSelected && numMotorsSelected == 2{
            robot = Robot.bigWheelsTwoMotors
        }else if bigWheelSelected{
            robot = Robot.bigWheelsNoMotor
        }else if numMotorsSelected == 1{
            robot = Robot.motorOnly
        }else if numMotorsSelected == 2{
            robot = Robot.twoMotors
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
    
    func checkDefaultWheelsTwoMotors() -> Bool{
        if robot == Robot.defaultWheelsTwoMotors{
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
    
    func checkBigWheelsTwoMotors() -> Bool{
        if robot == Robot.bigWheelsTwoMotors{
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
    
    func checkTwoMotors() -> Bool{
        if robot == Robot.twoMotors{
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

