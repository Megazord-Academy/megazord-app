//
//  ImmersiveView.swift
//  MegazordApp
//
//  Created by Bruno Dias on 25/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    @EnvironmentObject var helper: Helper
    
    
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let scene = try? await Entity(named: helper.sceneToLoad, in: realityKitContentBundle) {
                
                if let normalCar = scene.findEntity(named: "car_normalWheels_motor") {
                    normalCar.isEnabled = helper.normalCar
                }else{
                    print("não achou carro normal")
                }
                if let bigCar = scene.findEntity(named: "car_bigWheels_motor") {
                    bigCar.isEnabled = helper.BigWheelsCar
                }else{
                    print("não achou carro com rodona")
                }
                
                
                content.add(scene)
            }
            
        }
    }
}
