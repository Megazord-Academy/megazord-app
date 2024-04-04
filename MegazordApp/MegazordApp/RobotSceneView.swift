//
//  RobotScene.swift
//  MegazordApp
//
//  Created by Raphael Ferezin Kitahara on 04/04/24.
//

import SceneKit
import SwiftUI

struct RobotSceneView: UIViewRepresentable {
    @EnvironmentObject var robotController: RobotController
    typealias UIViewType = SCNView
    typealias Context = UIViewRepresentableContext<RobotSceneView>
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
    func makeUIView(context: Context) -> UIViewType {
        let view = SCNView()
        view.backgroundColor = UIColor.clear // this is key!
        view.allowsCameraControl = true
        view.autoenablesDefaultLighting = true
        
        // load the object here, could load a .scn file too
        view.scene = SCNScene(named: "\(robotController.robotImage).usdz")!
        if let cameraName = view.scene?.rootNode.camera?.name {
            view.scene?.rootNode.childNode(withName: cameraName, recursively: false)?.position.x = 2
        }

        view.scene?.rootNode.rotation = SCNVector4Make(1, -2, 0, Float(Double.pi/4))
        
        return view
    }
}
