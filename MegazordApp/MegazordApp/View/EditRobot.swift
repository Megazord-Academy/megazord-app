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
    
    @State var selectedWheelID = 1
    @State var selectedMotorID = 1
    
    
    var wheelList: [Assembly] = [
    Assembly(id: 1, imageName: "noWheel", Title: "No Wheels", description: "Looks like your car is missing wheels! Without wheels, your car won't be able to move."),
    Assembly(id: 2, imageName: "normalWheel", Title: "Normal Wheels", description: "Standard wheels for basic functionality. Great for general movement and maneuverability."),
    Assembly(id: 3, imageName: "bigWheel", Title: "Big Wheels", description: "Larger wheels designed to pass over larger objects with ease. Perfect for navigating rough terrain or obstacles.")
    
    ]
    var motorList: [Assembly] = [
    Assembly(id: 1, imageName: "noMotor", Title: "No Wheels", description: "Your car seems to be missing a motor! Without a motor, your car won't have any power to move."),
    Assembly(id: 2, imageName: "motor", Title: "Normal Wheels", description: "Standard motor for powering your car. Provides adequate propulsion for basic movement."),
    Assembly(id: 3, imageName: "doubleMotor", Title: "Big Wheels", description: "Double the power with two motors! Offers increased speed and torque for improved performance, especially on challenging surfaces.")
    
    ]
    
    var body: some View {
         
//                Spacer()
                VStack{
                    CardView(color: "colorPurple", title: "Wheels") {
                        VStack(alignment: .leading) {
                            
                            
                            ScrollView(.horizontal){
                                HStack{
                                    ForEach(wheelList, id: \.id) { wheel in
                                        
                                        Button {
                                            print("Botão clicado!")
                                            selectedWheelID = wheel.id
                                        } label: {
                                            VStack(spacing:16){
                                                Spacer()
                                                Image(wheel.imageName)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 100, height: 64)
                                                Text(wheel.Title)
                                                    .font(.title3)
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                Text(wheel.description)
                                                    .font(.subheadline)
                                                    .fixedSize(horizontal: false, vertical: true)
                                                    .frame(maxWidth: 220, alignment: .leading)
                                                Spacer()
                                            }
                                            
//                                            .padding(12)
                                        }
                                        .overlay(
                                                                    RoundedRectangle(cornerRadius: 10)
                                                                        .stroke(selectedWheelID == wheel.id ? Color.white : Color.clear, lineWidth: 3) // Stroke (borda) condicional
                                                                )
                                        
                                        .buttonBorderShape(.roundedRectangle(radius: 12))
                                        
                                        
                                        

                
                                    }
                                }
                            }
                               
                                
                            
                            Spacer()
                        }
                        .padding()
                        
                    }
                    CardView(color: "colorBlue", title: "Motors") {
                        VStack(alignment: .leading) {
                            HStack{
                                ScrollView(.horizontal){
                                    HStack{
                                        ForEach(motorList, id: \.id) { motor in
                                            
                                            Button {
                                                        print("Botão clicado!")
                                                selectedMotorID = motor.id
                                                    } label: {
                                                        VStack(spacing:16){
                                                            Spacer()
                                                            Image(motor.imageName)
                                                                .resizable()
                                                                .scaledToFill()
                                                                .frame(width: 90, height: 50)
                                                                .padding(.top, 8)

                                                            Text(motor.Title)
                                                                .font(.title3)
                                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                                
                                                                .padding(.top, 8)
                                                            
                                                            Text(motor.description)
                                                                .font(.subheadline)
                                                                .fixedSize(horizontal: false, vertical: true)
                                                                .frame(maxWidth: 220, alignment: .leading)
                                                                .padding(.top, 4)
                                                            Spacer()
                                                        }
                                                        
                                                    }
                                                    .overlay(
                                                                                RoundedRectangle(cornerRadius: 12)
                                                                                    .stroke(selectedMotorID == motor.id ? Color.white : Color.clear, lineWidth: 3) // Stroke (borda) condicional
                                                                            )
                                                    .buttonBorderShape(.roundedRectangle(radius: 12))
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
                .frame(maxWidth: 700,maxHeight: .infinity)
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
     
    
//            HStack{
//                Spacer()
//
//                Button("BigWheels"){
//                    robotController.putBigWheels()
//                    sceneController.showEditRobotImmersive = false
//                }
//
//                Button("DefaultWheels"){
//                    robotController.putDefaultWheels()
//                    sceneController.showEditRobotImmersive = false
//
//                }
//
//                Button("Motor"){
//                    robotController.putMotor()
//                    sceneController.showEditRobotImmersive = false
//
//                }
//
//                Spacer()
//            }
