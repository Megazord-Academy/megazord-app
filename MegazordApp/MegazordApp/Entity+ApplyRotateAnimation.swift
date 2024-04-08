import Foundation
import RealityKit

extension Entity {
    func applyRotateAnimation(angle: Float, axis: SIMD3<Float>, speed: Float) {
        var transform = self.transform
        let rotation = simd_quatf(angle: angle, axis: axis)
        transform.rotation *= rotation
        
        let animationDefinition = FromToByAnimation(to: transform, bindTarget: .transform)
        let animationViewDefinition = AnimationView(source: animationDefinition, speed: speed)
        let animationResource = try! AnimationResource.generate(with: animationViewDefinition)
        
        self.playAnimation(animationResource.repeat())
    }
}
