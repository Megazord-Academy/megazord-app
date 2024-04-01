import SwiftUI
import RealityKit
import RealityKitContent
import Combine

struct ImmersiveView: View {
    @EnvironmentObject var robotController: RobotController
    @EnvironmentObject var sceneController: SceneController
    
    func handleSceneEventsUpdate(event: SceneEvents.Update) {
        if let robot = event.scene.findEntity(named: robotController.robotState()) as? HasPhysicsBody, let scene = robot.parent {
            robot.physicsBody?.linearDamping = 2
            
            let robotPhysics = robotController.applyPhysics()
            robot.addForce(robotPhysics.force, relativeTo: scene)
            robot.physicsBody?.massProperties.mass = robotPhysics.mass
        }
    }
    
    var body: some View {
        RealityView { content in
            _ = content.subscribe(to: SceneEvents.Update.self) { event in
                self.handleSceneEventsUpdate(event: event)
            }
            
            if let scene = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                sceneController.decideRobot(scene: scene, robotController: robotController)

                content.add(scene)
            }
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
}
