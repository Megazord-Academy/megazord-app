//
//  TutorialLessonFailedSheet.swift
//  MegazordApp
//
//  Created by Raphael Ferezin Kitahara on 27/03/24.
//

import SwiftUI

struct TutorialLessonFailedSheetView: View {
    @Binding var sheetVisibility: Bool
    @EnvironmentObject var sceneController: SceneController
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Not there yet!")
                .font(.title)
                .fontWeight(.bold)
            
            Image("wand")
                .resizable()
                .scaledToFit()
                .frame(height: 60)
            
            Text("Looks like there's room for improvement! Don't worry, engineering is all about learning from mistakes. Try adjusting the placement of the components and testing again. You're on the right track!")
                .multilineTextAlignment(.center)
                .lineLimit(3...10)
                .frame(maxWidth: 440)
            
            VStack(spacing: 12) {
                Button {
                    sheetVisibility = false
                    
                } label: {
                    Text("Let's try again")
                }
                .buttonBorderShape(.roundedRectangle)
                
                Button {
                    sheetVisibility = false
                    sceneController.levelCompleted = false
                    router.resetPath()
                    
                } label: {
                    Text("Back to Lesson Selection")
                        .padding(12)
                }
                .buttonBorderShape(.roundedRectangle)
                .buttonStyle(.plain)
            }
            
        }
        .padding(36)
    }
}
