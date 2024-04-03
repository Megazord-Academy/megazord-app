//
//  Router.swift
//  MegazordApp
//
//  Created by Raphael Ferezin Kitahara on 03/04/24.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    @Published var path: [String]
    
    init() {
        self.path = []
    }
    
    func navigateTo(_ appRoute: String) {
        path.append(appRoute)
    }
    
    func resetPath() {
        self.path = []
    }
    
}
