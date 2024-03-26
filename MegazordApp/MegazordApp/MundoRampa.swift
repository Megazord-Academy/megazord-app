//
//  File.swift
//  MegazordApp
//
//  Created by Bruno Dias on 26/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct MundoRampa: View {
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let scene = try? await Entity(named: "mundoRampa", in: realityKitContentBundle) {
                content.add(scene)
            }
        }
    }
}

#Preview(immersionStyle: .mixed) {
    MundoRampa()
}
