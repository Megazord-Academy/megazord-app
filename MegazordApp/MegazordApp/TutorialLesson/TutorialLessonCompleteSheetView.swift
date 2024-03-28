//
//  LessonCompleteSheetView.swift
//  MegazordApp
//
//  Created by Raphael Ferezin Kitahara on 27/03/24.
//

import SwiftUI

struct TutorialLessonCompleteSheetView: View {
    
    @Binding var sheetVisibility: Bool
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Congratulations!")
                .font(.title)
                .fontWeight(.bold)
            
            Text("You've successfully built and tested your own car model. Keep exploring the world of engineering and discovering the endless possibilities it offers.")
                .multilineTextAlignment(.center)
                .lineLimit(3...10)
                .frame(maxWidth: 600)
            
            Text("You can now continue crafting in the next lessons!")
                .multilineTextAlignment(.center)
                .lineLimit(3...10)
                .frame(maxWidth: 600)
            
            VStack(spacing: 16) {
                Button {
                    
                } label: {
                    Text("Go Back to Lesson Selection")
                }
                .buttonBorderShape(.roundedRectangle)
                
                Button {
                    sheetVisibility = false
                } label: {
                    Text("Keep Exploring")
                }
                .buttonBorderShape(.roundedRectangle)
            }
            
        }
        .padding(24)
    }
}