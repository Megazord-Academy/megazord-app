import SwiftUI
import RealityKit
import RealityKitContent
import Combine

struct ImmersiveView: View {
    func handleSceneEventsUpdate(event: SceneEvents.Update) {
        if let robot = event.scene.findEntity(named: "car_normalWheels_motor") as? HasPhysicsBody, let scene = robot.parent {
            robot.addForce(SIMD3(x: 4, y: 0, z: 0), relativeTo: scene)
        }
    }
    
    var body: some View {
        RealityView { content in
            _ = content.subscribe(to: SceneEvents.Update.self) { event in
                self.handleSceneEventsUpdate(event: event)
            }
            
            if let scene = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(scene)
            }
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
}
