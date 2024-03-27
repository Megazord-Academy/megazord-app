//
//  LessonView.swift
//  MegazordApp
//
//  Created by Raphael Ferezin Kitahara on 27/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

enum SimulatorStatus {
    case closed
    case open
    case running
    case stopped
}

struct LessonView: View {
    var lessonName: String = "Tutorial Lesson"
    var simulatorCardText: String = "You need to launch the simulator in order to test your robot."
    var simulatorStatus: SimulatorStatus = .open
    
    /// Variable that controls the robot editor sheet visibility on the lesson view.
    @State var showRobotEditorSheet: Bool = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            // description card
            CardView(color: "Green", title: "Description") {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        TextSection(sectionTitle: "Introduction") {
                            Text("Welcome to the Engineering Lab! In this lesson, you'll dive into the world of engineering by building and testing your very own car model. Follow the steps below to assemble your car and watch it come to life in the simulator!")
                        }
                        
                        TextSection(sectionTitle: "Lesson Goal") {
                            Text("To understand the basic principles of engineering and mechanics by assembling a simple car model and testing its functionality within a simulator.")
                        }
                        
                        TextSection(sectionTitle: "Instructions") {
                            VStack(alignment: .leading, spacing: 16) {
                                HStack(alignment: .center, spacing: 24) {
                                    Text("1. Start by clicking on Edit Robot to enter the car assembly mode, where you’ll be able to customize your car.")
                                    
                                    Image(systemName: "wrench.adjustable.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 32)
                                }
                                
                                HStack(alignment: .center, spacing: 24) {
                                    Text("2. Once in the assembly mode, you'll see a new window, with all of the elements you can add to your car. You can select them and see how they affect your creation. Keep in mind that different components affect the car in different ways.")
                                    
                                    Image("normalWheelsIllustration")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                }
                                
                                HStack(alignment: .center, spacing: 24) {
                                    Text("3. After assembling your car, it's time to test its functionality. Launch the simulator to observe how your car moves and behaves. Pay attention to any issues or improvements needed.")
                                    
                                    Image(systemName: "bolt.batteryblock.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 32)
                                }
                                
                                Text("4. If you encounter any issues during testing, don't worry! Troubleshoot the problem by analyzing the behavior of your car and proposing potential solutions.")
                                
                                Text("5. Congratulations! You've successfully built and tested your own car model. Keep exploring the world of engineering and discovering the endless possibilities it offers.")
                            }
                            
                            
                        }
                    }
                    .padding()
                }
                
            }
            
            VStack(spacing: 16) {
                // your robot card
                CardView(color: "Orange", title: "Your Robot", content: {
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            
                            Image("carImage")
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                        Button {
                            // action
                        } label: {
                            Label("Edit Robot", systemImage: "wrench.adjustable.fill")
                        }
                        .buttonBorderShape(.roundedRectangle)
                    }
                    .padding()
                })
                
                HStack {
                    // robot status card
                    CardView(color: "Purple", title: "Robot Status") {
                        VStack(alignment: .leading) {
                            HStack(alignment: .center) {
                                Circle()
                                    .frame(width: 16, height: 16)
                                    .foregroundStyle(.gray)
                                
                                Text("Off")
                            }
                            
                            Text("You need to launch the simulator to activate your robot.")
                            
                            Spacer()
                        }
                        .padding()
                        
                    }
                    
                    // simulator card
                    CardView(color: "Blue", title: "Simulator") {
                        VStack(alignment: .leading) {
                            
                            Text(simulatorCardText)
                            
                            if simulatorStatus == .closed {
                                Button {
                                    // action
                                } label: {
                                    Label("Launch", systemImage: "bolt.batteryblock.fill")
                                }
                                .buttonBorderShape(.roundedRectangle)
                                
                            } else {
                                HStack {
                                    // play button
                                    Button {
                                        // action
                                    } label: {
                                        Label("Play", systemImage: "play.fill")
                                    }
                                    .buttonBorderShape(.roundedRectangle)
                                    
                                    // close button
                                    Button {
                                        // action
                                    } label: {
                                        Label("Close", systemImage: "rectangle.slash.fill")
                                    }
                                    .buttonBorderShape(.roundedRectangle)
                                }
                                
                            }
                            
                            
                            Spacer()
                        }
                        .padding()
                        
                        
                    }
                }
                
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
        .navigationTitle(lessonName)
        .navigationBarTitleDisplayMode(.inline)
    }
}



struct TextSection<Content: View>: View {
    var sectionTitle: String
    
    @ViewBuilder var content: Content
    
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(sectionTitle)
                    .font(.title3)
                    .fontWeight(.bold)
                
                content
                
            }
        }
    }
}



#Preview(windowStyle: .automatic) {
    NavigationStack {
        LessonView()
    }
}
