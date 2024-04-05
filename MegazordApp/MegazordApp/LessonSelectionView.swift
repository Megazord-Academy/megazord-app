//
//  LessonSelectionView.swift
//  MegazordApp
//
//  Created by Raphael Ferezin Kitahara on 05/04/24.
//

import SwiftUI

struct LessonSelectionView: View {
    var body: some View {
        HStack(spacing: 24) {
            NavigationLink(value: "TutorialLesson") {
                CardView(color: "colorGreen", icon: "bookmark", title: "First Steps") {
                    VStack {
                        Image("car_motor")
                            .resizable()
                            .scaledToFit()
                            .padding(64)
                        
                        Text("Learn how to assemble your first robotics masterpiece! Explore the main components of it and have fun hovering over the playgrounds.")
                        
                        Spacer()
                    }
                    .padding()
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(value: "TutorialLesson") {
                            Image(systemName: "play.fill")
                        }
                        .buttonBorderShape(.circle)
                    }
                    .padding()
                }
            }
            .buttonStyle(.plain)
            .buttonBorderShape(.roundedRectangle(radius: 16))
            
            NavigationLink(value: "RampLesson") {
                CardView(color: "colorGreen", icon: "bookmark", title: "Friction Ramp") {
                    VStack(spacing: 16) {
                        Image("car_motor")
                            .resizable()
                            .scaledToFit()
                            .padding(64)
                        
                        Text("Create creative solutions to overcome an inclined plane! Feel free to play with the wheel's size and motor's torque.")
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            NavigationLink(value: "RampLesson") {
                                Image(systemName: "play.fill")
                            }
                            .buttonBorderShape(.circle)
                        }
                        .padding()
                    }
                }
            }
            .buttonStyle(.plain)
            .buttonBorderShape(.roundedRectangle(radius: 16))
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
        .navigationTitle("Lesson Selection")
    }
}

#Preview {
    LessonSelectionView()
}
