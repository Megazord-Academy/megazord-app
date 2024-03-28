//
//  TutorialLessonFailedSheet.swift
//  MegazordApp
//
//  Created by Raphael Ferezin Kitahara on 27/03/24.
//

import SwiftUI

struct TutorialLessonFailedSheetView: View {
    @Binding var sheetVisibility: Bool
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Not there yet!")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Looks like there's room for improvement! Don't worry, engineering is all about learning from mistakes. Try adjusting the placement of the components and testing again. You're on the right track!")
                .multilineTextAlignment(.center)
                .lineLimit(.max)
            
            VStack(spacing: 16) {
                Button {
                    sheetVisibility = false
                } label: {
                    Text("Let's try again")
                }
                .buttonBorderShape(.roundedRectangle)
                
                Button {
                    
                } label: {
                    Text("Back to Lesson Selection")
                }
                .buttonBorderShape(.roundedRectangle)
            }
            
        }
        .padding(24)
    }
}
