//
//  LessonViewModel.swift
//  MegazordApp
//
//  Created by Raphael Ferezin Kitahara on 27/03/24.
//

import Foundation
import SwiftUI

enum SimulatorStatus {
    case closed
    case open
    case running
}

enum RobotStatus {
    case idle
    case stuck
    case moving
    case off
}

class TutorialLessonViewModel: ObservableObject {
    /// The lesson name, passed onto the navigation title
    let lessonName: String
    
    /// String with the image name for the current robot that will be shown on the "My Robot" card in the lesson view
    @Published var robotImage: String = "normalWheelsIllustration"
    
    /// Holds the current `RobotStatus`.
    @Published var robotStatus: RobotStatus = .off
    
    /// The text that will appear on the simulator card, on the Lesson view.
    @Published var simulatorCardText: String
    
    /// Holds the status of the simulator.
    @Published var simulatorStatus: SimulatorStatus = .closed
    
    @Published var showLessonCompleteSheet: Bool = false
    
    @Published var showLessonFailedSheet: Bool = false
    
    /// Variable that controls the robot editor sheet visibility on the lesson view.
    @Published var showRobotEditorSheet: Bool = false
    
    init(lessonName: String, simulatorCardText: String) {
        self.lessonName = lessonName
        self.simulatorCardText = simulatorCardText
    }
    
    func closeSimulatorButtonTapped() {
        self.simulatorStatus = .closed
    }
    
    func editRobotButtonTapped() {
        self.simulatorStatus = .closed
        self.showRobotEditorSheet = true
    }
    
    func launchSimulatorButtonTapped() {
        self.simulatorStatus = .open
        self.robotStatus = .idle
    }
    
    func playSimulatorButtonTapped() {
        self.simulatorStatus = .running
        self.showLessonCompleteSheet = true
    }
    
    func stopSimulatorButtonTapped() {
        self.simulatorStatus = .open
        self.showLessonFailedSheet = true
    }
}
