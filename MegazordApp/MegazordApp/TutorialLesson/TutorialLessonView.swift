//
//  LessonView.swift
//  MegazordApp
//
//  Created by Raphael Ferezin Kitahara on 27/03/24.
//

import RealityKit
import RealityKitContent
import SceneKit
import SwiftUI

struct TutorialLessonView: View {
    /// Auxiliary variable for dismissing the current immersive space (if it is open).
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    /// The lesson name, passed onto the navigation title.
    let lessonName: String = "Tutorial Lesson"
    
    /// Determines if the lesson complete sheet is shown (true) or not (false).
    @State var showLessonCompleteSheet: Bool = false
    
    /// Determines if the lesson failed sheet is shown (true) or not (false).
    @State var showLessonFailedSheet: Bool = false
    
    /// Variable that controls the robot editor sheet visibility on the lesson view.
    @State var showRobotEditorSheet: Bool = false
    
    /// The text that will appear on the simulator card, on the Lesson view.
    @State var simulatorCardText: String = "You need to launch the simulator in order to test your robot."
    
    /// Auxiliary variable for opening an immersive space (if there is none open at the moment).
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    
    /// Variable that holds the app's instance of the `RobotController` class.
    @EnvironmentObject var robotController: RobotController
    
    /// Router for managing navigation paths
    @EnvironmentObject var router: Router
    
    /// Variable that holds the app's instance of the `SceneController` class.
    @EnvironmentObject var sceneController: SceneController

    
    var body: some View {
        GeometryReader { geo in
            HStack(alignment: .top, spacing: 16) {
                // description card
                CardView(color: "colorGreen", icon: "bookmark", title: "Description") {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 24) {
                            TextSectionView(description: "In this lesson, you'll dive into the world of engineering by building and testing your very own car model.", icon: "magnifyingglass", title: "Introduction")
                            
                            TextSectionView(description: "To understand the basic principles of engineering and mechanics by assembling a simple car model and testing its functionality within a simulator.", icon: "target", title: "Objectives")
                            
                            TextSectionView(description: "Start by clicking on Edit to enter Robot Assembly mode, where you’ll be able to customize your car.", icon: "wrench.adjustable.fill", title: "Tip")
                            
                            TextSectionView(description: "Once in the Robot Assembly, you'll see all of the elements you can add to your car. Select them and see how they affect your creation.", icon: "circle.dotted.circle", title: "Tip")
                        }
                        .padding()
                    }
                    
                }
                
                VStack(spacing: 16) {
                    // your robot card
                    CardView(color: "colorOrange", icon: "wrench.adjustable", title: "Your Robot", content: {
                        VStack(alignment: .leading) {
                            HStack {
                                Spacer()
                                
                                Image(robotController.robotImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: geo.size.height / 3)
                                    
                                
                                Spacer()
                            }
                            
                            Spacer()
                            
                            Button {
                                sceneController.simulatorStatus = .closed
                                showRobotEditorSheet = true
                                sceneController.showRobotImmersive = true
                                
                            } label: {
                                Label("Edit Robot", systemImage: "wrench.adjustable.fill")
                            }
                            .buttonBorderShape(.roundedRectangle)
                            .sheet(isPresented: $showRobotEditorSheet) {
                                VStack {
                                    // header
                                    HStack {
                                        Text("Robot Editor")
                                            .font(.title)
                                        
                                        Spacer()
                                        
                                        Button {
                                            showRobotEditorSheet = false
                                            sceneController.showRobotImmersive = false
                                        } label: {
                                            Image(systemName: "xmark")
                                        }
                                        .buttonBorderShape(.circle)
                                    }
                                    .padding(.horizontal, 24)
                                    .padding(.top, 24)
                                    .padding(.bottom, 16)
                                    
                                    // view
                                    EditRobot()
                                }
                            }
                        }
                        .padding()
                    })
                    .onChange(of: sceneController.showRobotImmersive) { _, newValue in
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
                                        sceneController.showRobotImmersive = false
                                        robotController.robotStatus = .off
                                }
                            } else {
                                await dismissImmersiveSpace()
                                if showRobotEditorSheet{
                                    sceneController.showRobotImmersive = true
                                }
                                robotController.robotStatus = .off
                            }
                        }
                    }
                    
                    HStack(spacing: 16) {
                        // robot status card
                        CardView(color: "colorPurple", icon: "chart.bar", title: "Robot Status") {
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
                        CardView(color: "colorBlue", icon: "play", title: "Simulator") {
                            VStack(alignment: .leading) {
                                
                                Text(simulatorCardText)
                                
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
                                                sceneController.simulatorStatus = .running
                                                robotController.robotStatus = .moving
                                                sceneController.simulationCount += 1
                                                
                                                Task {
                                                    do {
                                                        let currentSimulation = sceneController.simulationCount
                                                        
                                                        try await Task.sleep(nanoseconds: 5000000000)
                                                        
                                                        if !sceneController.levelCompleted && sceneController.simulatorStatus == .running && currentSimulation == sceneController.simulationCount {
                                                            // showing sheet
                                                            showLessonFailedSheet = true
                                                            
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
                            .sheet(isPresented: $showLessonFailedSheet, content: {
                                TutorialLessonFailedSheetView(sheetVisibility: $showLessonFailedSheet)
                            })
                            
                        }
                        .sheet(isPresented: $showLessonCompleteSheet) {
                            TutorialLessonCompleteSheetView(sheetVisibility: $showLessonCompleteSheet)
                        }
                        .onChange(of: sceneController.levelCompleted, { oldValue, newValue in
                            // level was just completed
                            if oldValue == false && newValue == true {
                                showLessonCompleteSheet = true
                                robotController.robotStatus = .idle
                                sceneController.simulatorStatus = .open
                                robotController.isRobotInInitialPosition = false
                            }
                        })
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
            .navigationTitle(lessonName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}



//#Preview(windowStyle: .automatic) {
//    NavigationStack {
//        LessonView()
//    }
//}
