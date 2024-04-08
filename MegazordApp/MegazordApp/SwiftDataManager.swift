//
//  SwiftDataManager.swift
//  MegazordApp
//
//  Created by Raphael Ferezin Kitahara on 05/04/24.
//

import Foundation
import SwiftData

@Model
class SDRobot {
    var selectedWheelID = 0
    var selectedMotorID = 0
    
    init(selectedWheelID: Int = 0, selectedMotorID: Int = 0) {
        self.selectedWheelID = selectedWheelID
        self.selectedMotorID = selectedMotorID
    }
}

@Model
class SDLevelProgression {
    var currentLesson: Int
    var tutorialLessonComplete: Bool
    var rampLessonComplete: Bool
    
    init(currentLesson: Int, tutorialLessonComplete: Bool, rampLessonComplete: Bool) {
        self.currentLesson = currentLesson
        self.tutorialLessonComplete = tutorialLessonComplete
        self.rampLessonComplete = rampLessonComplete
    }
}
