//
//  EditRobot.swift
//  MegazordApp
//
//  Created by Caio Gomes Piteli on 25/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct EditRobot: View {
   @State var isPressed = false
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                Button("Change wheel size"){
                    isPressed.toggle()
                }
                Spacer()
            }
            Spacer()
        }.glassBackgroundEffect()
    }
}
