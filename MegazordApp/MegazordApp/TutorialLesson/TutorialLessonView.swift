//
//  LessonView.swift
//  MegazordApp
//
//  Created by Raphael Ferezin Kitahara on 27/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct LessonView: View {
    @EnvironmentObject var viewModel: TutorialLessonViewModel/*(lessonName: "Tutorial Lesson", simulatorCardText: "You need to launch the simulator in order to test your robot.")*/
    
    /// Variable that controls the robot editor sheet visibility on the lesson view.
    @State var showRobotEditorSheet: Bool = false
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    @EnvironmentObject var robotController: RobotController
    @EnvironmentObject var sceneController: SceneController

    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            // description card
            CardView(color: "colorGreen", title: "Description") {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        TextSectionView(sectionTitle: "Introduction") {
                            Text("Welcome to the Engineering Lab! In this lesson, you'll dive into the world of engineering by building and testing your very own car model. Follow the steps below to assemble your car and watch it come to life in the simulator!")
                        }
                        
                        TextSectionView(sectionTitle: "Lesson Goal") {
                            Text("To understand the basic principles of engineering and mechanics by assembling a simple car model and testing its functionality within a simulator.")
                        }
                        
                        TextSectionView(sectionTitle: "Instructions") {
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
                                    
                                    Image(viewModel.robotImage)
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
                CardView(color: "colorOrange", title: "Your Robot", content: {
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            
                            Image("carImage")
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                        Button {
                            sceneController.simulatorStatus = .closed
                            viewModel.editRobotButtonTapped()
                            viewModel.showRobotImmersive = true
                            
                        } label: {
                            Label("Edit Robot", systemImage: "wrench.adjustable.fill")
                        }
                        .buttonBorderShape(.roundedRectangle)
                        .sheet(isPresented: $viewModel.showRobotEditorSheet) {
                            EditRobot()
                            
                            Button {
                                viewModel.showRobotEditorSheet = false
                                viewModel.showRobotImmersive = false
                                
                            } label: {
                                Image(systemName: "xmark")
                            }

                        }
                    }
                    .padding()
                })
                .onChange(of: viewModel.showRobotImmersive) { _, newValue in
                    Task {
                        if newValue == true {
                            // closing simulator if it is open
                            if sceneController.simulatorStatus == .open || sceneController.simulatorStatus == .running {
                                await dismissImmersiveSpace()
                            }
                            
                            // opening robot immersive space
                            switch await openImmersiveSpace(id: "EditRobotImmersive") {
                            case .opened:
                                robotController.robotStatus = .idle
                            case .error, .userCancelled:
                                fallthrough
                            @unknown default:
                                viewModel.showRobotImmersive = false
                                robotController.robotStatus = .off
                            }
                        } else{
                            await dismissImmersiveSpace()
                            if viewModel.showRobotEditorSheet{
                                viewModel.showRobotImmersive = true
                            }
                            robotController.robotStatus = .off
                        }
                    }
                }
                
                HStack {
                    // robot status card
                    CardView(color: "colorPurple", title: "Robot Status") {
                        VStack(alignment: .leading) {
                            HStack(alignment: .center) {
                                switch robotController.robotStatus {
                                    case .idle:
                                        Circle()
                                            .frame(width: 16, height: 16)
                                            .foregroundStyle(.yellow)
                                        
                                        Text("Idle")
                                        
                                    case .stuck:
                                        Circle()
                                            .frame(width: 16, height: 16)
                                            .foregroundStyle(.red)
                                        
                                        Text("Stuck")
                                        
                                    case .moving:
                                        Circle()
                                            .frame(width: 16, height: 16)
                                            .foregroundStyle(.green)
                                        
                                        Text("Moving")
                                        
                                    case .off:
                                        Circle()
                                            .frame(width: 16, height: 16)
                                            .foregroundStyle(.gray)
                                        
                                        Text("Off")
                                }
                            }
                            
                            Text("You need to launch the simulator to activate your robot.")
                            
                            Spacer()
                        }
                        .padding()
                        
                    }
                    
                    // simulator card
                    CardView(color: "colorBlue", title: "Simulator") {
                        VStack(alignment: .leading) {
                            
                            Text(viewModel.simulatorCardText)
                            
                            if sceneController.simulatorStatus == .closed {
                                Button {
                                    sceneController.simulatorStatus = .open
                                } label: {
                                    Label("Launch", systemImage: "bolt.batteryblock.fill")
                                }
                                .buttonBorderShape(.roundedRectangle)
                                
                            } else {
                                HStack {
                                    // play/stop button
                                    Button {
                                        // deu play
                                        if sceneController.simulatorStatus == .open {
                                            //viewModel.playSimulatorButtonTapped()
                                            sceneController.simulatorStatus = .running
                                            robotController.robotStatus = .moving
                                            viewModel.simulationCount += 1
                                            
                                            Task {
                                                do {
                                                    let currentSimulation = viewModel.simulationCount
                                                    
                                                    try await Task.sleep(nanoseconds: 5000000000)
                                                    
                                                    if !sceneController.levelCompleted && sceneController.simulatorStatus == .running && currentSimulation == viewModel.simulationCount {
                                                        // showing sheet
                                                        viewModel.showLessonFailedSheet = true
                                                        
                                                        // stopping simulation
                                                        robotController.robotStatus = .idle
                                                        sceneController.simulatorStatus = .open
                                                        robotController.isRobotInInitialPosition = false
                                                    }
                                                    
                                                    
                                                } catch {
                                                    
                                                }
                                                
                                                
                                            }
                                            
                                        // deu stop
                                        } else {
                                            robotController.robotStatus = .idle
                                            sceneController.simulatorStatus = .open
                                            robotController.isRobotInInitialPosition = false
                                        }
                                        
                                    } label: {
                                        if sceneController.simulatorStatus == .running {
                                            Label("Stop", systemImage: "stop.fill")
                                        } else {
                                            Label("Play", systemImage: "play.fill")
                                        }
                                        
                                    }
                                    .buttonBorderShape(.roundedRectangle)
                                    
                                    // close button
                                    Button {
                                        sceneController.simulatorStatus = .closed
                                        
                                    } label: {
                                        Label("Close", systemImage: "rectangle.slash.fill")
                                    }
                                    .buttonBorderShape(.roundedRectangle)
                                }
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .sheet(isPresented: $viewModel.showLessonFailedSheet, content: {
                            TutorialLessonFailedSheetView(sheetVisibility: $viewModel.showLessonFailedSheet)
                        })
                        
                    }
                    .sheet(isPresented: $sceneController.levelCompleted) {
                        TutorialLessonCompleteSheetView(sheetVisibility: $sceneController.levelCompleted)
                    }
                    .onChange(of: sceneController.simulatorStatus) { oldValue, newValue in
                        Task {
                            if newValue == .open && oldValue != .running {
                                switch await openImmersiveSpace(id: "ImmersiveSpace") {
                                case .opened:
                                    robotController.robotStatus = .idle
                                case .error, .userCancelled:
                                    fallthrough
                                @unknown default:
                                    sceneController.simulatorStatus = .closed
                                    robotController.robotStatus = .off
                                }
                            } else if newValue == .closed {
                                await dismissImmersiveSpace()
                                sceneController.simulatorStatus = .closed
                                robotController.robotStatus = .off
                            }
                        }
                    }
                    
                }
                
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
        .navigationTitle(viewModel.lessonName)
        .navigationBarTitleDisplayMode(.inline)
    }
}



#Preview(windowStyle: .automatic) {
    NavigationStack {
        LessonView()
    }
}
