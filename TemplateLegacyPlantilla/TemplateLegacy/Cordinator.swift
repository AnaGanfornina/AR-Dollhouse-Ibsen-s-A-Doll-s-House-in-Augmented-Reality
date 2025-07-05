//
//  Cordinator.swift
//  TemplateLegacy
//
//  Created by Ana on 28/6/25.
//
import Foundation
import ARKit
import RealityKit
import Combine

class Cordinator: NSObject {
    weak var view: ARView?
    
    var cancelable = Set<AnyCancellable>()
    
    func setup(){
        guard let arView = view else {return}
        
        let anchor = AnchorEntity(plane: .horizontal)
        
        //añadimos una box a la escena
        
        //let box = ModelEntity(mesh: MeshResource.generateBox(size: 0.5), materials: [SimpleMaterial(color: .blue, isMetallic: true)])
        // https://developer.apple.com/documentation/realitykit/occlusionmaterial
        //let box = ModelEntity(mesh: MeshResource.generateBox(size: 0.5), materials: [OcclusionMaterial()])

        //box.generateCollisionShapes(recursive: true)
        //anchor.addChild(box)
        //arView.installGestures(.all, for: box)
        //fin box
        
        // cargamos con combine el robot
        /*
        ModelEntity.loadAsync(named: "robot")
            .sink { completion in
                switch completion {
                case .finished:
                    NSLog("cargando el modelo")
                case .failure(let error):
                    NSLog("error al cargar: \(error)")
                }
            } receiveValue: { entity in
                //añado al anchor
                anchor.addChild(entity)
            }
            .store(in: &cancelable)
        */
        // cargamos con combine el salón
        ModelEntity.loadAsync(named: "Nora")
            .sink { completion in
                switch completion {
                case .finished:
                    NSLog("cargando el modelo")
                case .failure(let error):
                    NSLog("error al cargar: \(error)")
                }
            } receiveValue: { entity in
                //añado al anchor
                anchor.addChild(entity)
            }
            .store(in: &cancelable)

        
        //añadimos el ancla a la escena
        
        arView.scene.addAnchor(anchor)
    }
}
