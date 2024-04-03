//
//  LessonViewModel.swift
//  MegazordApp
//
//  Created by Raphael Ferezin Kitahara on 27/03/24.
//

import Foundation
import SwiftUI





class TutorialLessonViewModel: ObservableObject {
    
    /// The lesson name, passed onto the navigation title
    let lessonName: String
    
    @Published var simulationCount = 0
    
    /// String with the image name for the current robot that will be shown on the "My Robot" card in the lesson view
    @Published var robotImage: String = "normalWheelsIllustration"
    
    /// The text that will appear on the simulator card, on the Lesson view.
    @Published var simulatorCardText: String
        
    @Published var showLessonFailedSheet: Bool = false
    
    /// Variable that controls the robot editor sheet visibility on the lesson view.
    @Published var showRobotEditorSheet: Bool = false
    
    @Published var showRobotImmersive: Bool = false
    
    init(lessonName: String, simulatorCardText: String) {
        self.lessonName = lessonName
        self.simulatorCardText = simulatorCardText
    }
    

    
    func editRobotButtonTapped() {
        self.showRobotEditorSheet = true
    }

}
