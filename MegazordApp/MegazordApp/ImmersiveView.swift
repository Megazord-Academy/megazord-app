import SwiftUI
import RealityKit
import RealityKitContent
import Combine

struct ImmersiveView: View {
    @EnvironmentObject var robotController: RobotController
    @EnvironmentObject var sceneController: SceneController
    
    func handleSceneEventsUpdate(event: SceneEvents.Update) {
        
        if let robot = event.scene.findEntity(named: robotController.robotModelName()) as? HasPhysicsBody, let scene = robot.parent {
            let robotPhysics = robotController.applyPhysics()
            if robotController.robotStatus == .moving{
                robot.addForce(robotPhysics.force, relativeTo: scene)
            }
            
            if let initialPosition = robotController.initialPosition{
                if !robotController.isRobotInInitialPosition && robotController.robotStatus == .idle {
                    robot.clearForcesAndTorques()
                    robot.physicsBody?.isTranslationLocked = (x: true, y: false, z: true)
                    robot.position = initialPosition
                    robotController.isRobotInInitialPosition = true
                } else if robotController.robotStatus == .moving {
                    robot.physicsBody?.isTranslationLocked = (x: false, y: false, z: true)
                }
            }
        }
        
    }
    
    func handleCollisionDetection(event: CollisionEvents.Began) async throws{
        if event.entityA.name == "finalLine" || event.entityB.name == "finalLine"{
            sceneController.levelCompleted = true
        }

    }
    
    
    
    var body: some View {
        RealityView { content in
            _ = content.subscribe(to: SceneEvents.Update.self) { event in
                self.handleSceneEventsUpdate(event: event)
            }
            _ = content.subscribe(to: CollisionEvents.Began.self, on: nil, componentType: nil) { event in
                Task{
                    try await handleCollisionDetection(event: event)
                }
            }
            
            if let scene = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                sceneController.decideRobot(scene: scene, robotController: robotController)

                if let robot = scene.findEntity(named: robotController.robotModelName()) as? HasPhysicsBody {
                    let robotPhysics = robotController.applyPhysics()
                    robot.physicsBody?.massProperties.mass = robotPhysics.mass
                    robot.physicsBody?.linearDamping = 2
                    if robotController.initialPosition == nil{
                        robotController.initialPosition = robot.position
                    }
                }
                
                content.add(scene)
            }
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
}
