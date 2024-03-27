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
        if numMotorsSelected > 2 {
            numMotorsSelected = 0
        }
        decideRobotNewCase()
    }
    
    func decideRobotNewCase() {
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

