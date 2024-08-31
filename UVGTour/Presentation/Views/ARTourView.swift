//
//  ARTourView.swift
//  UVGTour
//
//  Created by Guillermo Santos Barrios on 8/29/24.
//

import SwiftUI
import UIKit
import ARKit
import RealityKit
import Combine

struct ARTourView: UIViewRepresentable {
    let framePublisher = PassthroughSubject<Void, Never>()
    
    
    // MARK: Lifecycle methods
    
    
    func makeUIView(context: Context) -> some UIView {
        return createSceneExperience(in: context)
    }
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    
    // MARK: AR Tour
    
    
    /// Creates the AR experience using ``SCNView``.
    func createSceneExperience(in context: Context) -> some UIView {
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.environmentTexturing = .automatic
        
        // Create an AR session with the configuration
        arView.session.run(config)
        
        // Create a test cube
        let boxMesh = MeshResource.generateBox(size: 0.1) // 10 cm cube
        let boxMaterial = UnlitMaterial(color: .blue) // Use unlit material for consistent color
        let boxEntity = ModelEntity(mesh: boxMesh, materials: [boxMaterial])
        
        // Create an anchor entity to attach to the camera
        let cameraAnchor = AnchorEntity(.camera)
        
        
        // Add the anchor to the AR scene
        let worldAnchor = AnchorEntity(world: [0, 0, 0])
        worldAnchor.addChild(boxEntity)
        arView.scene.anchors.append(worldAnchor)
        arView.scene.anchors.append(cameraAnchor)
        
        // Continuously update the position of the cube to always be in front of the camera
        framePublisher
            .throttle(for: .milliseconds(200), scheduler: DispatchQueue.main, latest: true)
            .sink { _ in
                // Define the target position and rotation
                let targetPosition = SIMD3<Float>(0, 0, -0.5)
                // Animate the position and orientation change
                boxEntity.move(
                    to: Transform(
                        translation: targetPosition
                    ),
                    relativeTo: cameraAnchor,
                    duration: 0.2,
                    timingFunction: .easeInOut
                )
            }
            .store(in: &context.coordinator.cancellables)
        
        // Trigger the frame updates
        arView.scene.subscribe(to: SceneEvents.Update.self) { _ in
            framePublisher.send()
        }.store(in: &context.coordinator.cancellables)
        
        return arView
    }
    
    
    
    class Coordinator: NSObject {
        var cancellables = Set<AnyCancellable>()
    }
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    
}
