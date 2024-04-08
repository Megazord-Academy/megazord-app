//
//  LessonCompleteSheetView.swift
//  MegazordApp
//
//  Created by Raphael Ferezin Kitahara on 27/03/24.
//

import SwiftUI

struct TutorialLessonCompleteSheetView: View {
    @EnvironmentObject var robotController: RobotController
    @EnvironmentObject var sceneController: SceneController
    @EnvironmentObject var router: Router
    @Binding var sheetVisibility: Bool
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Congratulations!")
                .font(.title)
                .fontWeight(.bold)
            
            Image("checkmark")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            
            Text("You've successfully built and tested your own car model. Keep exploring the world of engineering and discovering the endless possibilities it offers.")
                .multilineTextAlignment(.center)
                .lineLimit(3...10)
                .frame(maxWidth: 480)
            
            Text("You can now continue crafting in the next lessons!")
                .multilineTextAlignment(.center)
                .lineLimit(3...10)
                .frame(maxWidth: 480)
            
            VStack(spacing: 12) {
                Button {
                    sheetVisibility = false
                    sceneController.levelCompleted = false
                    router.resetPath()
                    
                } label: {
                    Text("Go Back to Lesson Selection")
                }
                .buttonBorderShape(.roundedRectangle)
                
                Button {
                    sheetVisibility = false
                    robotController.robotStatus = .idle
                    sceneController.simulatorStatus = .open
                    robotController.isRobotInInitialPosition = false
                    sceneController.levelCompleted = false
                    
                } label: {
                    Text("Keep Exploring")
                        .padding(12)
                }
                .buttonBorderShape(.roundedRectangle)
                .buttonStyle(.plain)
            }
            
        }
        .padding(36)
    }
}
