//
//  EditRobot.swift
//  MegazordApp
//
//  Created by Caio Gomes Piteli on 25/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct EditRobot: View {
    @EnvironmentObject var robotController: RobotController
    @EnvironmentObject var sceneController: SceneController
    
    
    
    
    var wheelList: [Assembly] = [
    Assembly(id: 0, imageName: "noWheels", Title: "No Wheels", description: "Looks like your car is missing wheels! Without wheels, your car won't be able to move."),
    Assembly(id: 1, imageName: "normalWheels", Title: "Normal Wheels", description: "Standard wheels for basic functionality. Great for general movement and maneuverability."),
    Assembly(id: 2, imageName: "bigWheels", Title: "Big Wheels", description: "Larger wheels designed to pass over larger objects with ease. Perfect for navigating rough terrain or obstacles.")
    
    ]
    var motorList: [Assembly] = [
    Assembly(id: 0, imageName: "noMotor", Title: "No Motor", description: "Your car seems to be missing a motor! Without a motor, your car won't have any power to move."),
    Assembly(id: 1, imageName: "singleMotor", Title: "Single Motor", description: "Standard motor for powering your car. Provides adequate propulsion for basic movement."),
    Assembly(id: 2, imageName: "dualMotor", Title: "Dual Motor", description: "Double the power with two motors! Offers increased speed and torque for improved performance.")
    
    ]
    
    var body: some View {
         
//                Spacer()
                VStack{
                    CardView(color: "colorOrange", title: "Wheels") {
                        VStack(alignment: .leading) {
                            
                            
                            ScrollView(.horizontal){
                                HStack{
                                    ForEach(wheelList, id: \.id) { wheel in
                                        
                                        Button {
                                            print("Botão clicado!")
                                            robotController.selectedWheelID = wheel.id
                                            print(robotController.selectedWheelID)
                                            robotController.decideRobotNewCase()
                                            sceneController.showEditRobotImmersive = false

                                        } label: {
                                            VStack(spacing:8){
                                                Spacer()
                                                Image(wheel.imageName)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 110, height: 120)
                                                Text(wheel.Title)
                                                    .font(.title3)
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                Text(wheel.description)
                                                    .font(.subheadline)
                                                    .fixedSize(horizontal: false, vertical: true)
                                                    .frame(maxWidth: 220, alignment: .leading)
                                                    .lineLimit(4, reservesSpace: true)
                                                Spacer()
                                            }
                                            
//                                            .padding(12)
                                        }
                                        .overlay(
                                                                    RoundedRectangle(cornerRadius: 10)
                                                                        .stroke(robotController.selectedWheelID == wheel.id ? Color.white : Color.clear, lineWidth: 3) // Stroke (borda) condicional
                                                                )
                                        
                                        .buttonBorderShape(.roundedRectangle(radius: 12))
                                        
                                        .padding(4)
                                        

                
                                    }
                                    
                                }
                            }
                               
                                
                            
                            Spacer()
                        }
                        .padding()
                        
                    }
                    CardView(color: "colorOrange", title: "Motors") {
                        VStack(alignment: .leading) {
                            HStack{
                                ScrollView(.horizontal){
                                    HStack{
                                        ForEach(motorList, id: \.id) { motor in
                                            
                                            Button {
                                                        print("Botão clicado!")
                                                robotController.selectedMotorID = motor.id
                                                print(robotController.selectedMotorID)
                                                robotController.decideRobotNewCase()
                                                sceneController.showEditRobotImmersive = false


                                                    } label: {
                                                        HStack(alignment: .top){
                                                            VStack(spacing: 8){
                                                                Spacer()
                                                                Image(motor.imageName)
                                                                    .resizable()
                                                                    .scaledToFit()
                                                                    .frame(width: 110, height: 65)
                                                                //                                                                .padding(.top, 8)
                                                                //                                                            Spacer()
                                                                
                                                                Text(motor.Title)
                                                                    .font(.title3)
                                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                                
                                                                //                                                            Spacer()
                                                                Text(motor.description)
                                                                    .font(.subheadline)
                                                                    .fixedSize(horizontal: false, vertical: true)
                                                                    .frame(maxWidth: 220, alignment: .leading)
                                                                    .lineLimit(5, reservesSpace: true)
                                                                //                                                                .multilineTextAlignment(.top)
                                                                //                                                                .padding(.top, 4)
                                                                Spacer()
                                                            }
                                                        }
                                                        
                                                    }
                                                    .overlay(
                                                                                RoundedRectangle(cornerRadius: 12)
                                                                                    .stroke(robotController.selectedMotorID == motor.id ? Color.white : Color.clear, lineWidth: 3) // Stroke (borda) condicional
                                                                            )
                                                    .buttonBorderShape(.roundedRectangle(radius: 12))
                                                    .padding(4)

                                        }
                                    }
                                }
                               
                                
                            }
                            Spacer()
                        }
                        .padding()
                        
                    }
                    
                    
                }.padding()
                

                .navigationTitle("Robot Assembly")
//                .frame(maxWidth: 700,maxHeight: .infinity)
                .glassBackgroundEffect()
                
    }
    
}

#Preview(windowStyle: .automatic) {
    NavigationStack {
        EditRobot()
    }
}


struct Assembly {
    
    let id: Int
    var imageName: String
    var Title: String
    var description: String
    
    init(id: Int, imageName: String, Title: String, description: String) {
        self.id = id
        self.imageName = imageName
        self.Title = Title
        self.description = description
    }
   
    
    
}
