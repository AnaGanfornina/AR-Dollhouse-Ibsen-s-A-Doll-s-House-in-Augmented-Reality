//
//  ContentView.swift
//  TemplateLegacy
//
//  Created by Keepcoding 2025
//

import SwiftUI
import RealityKit


struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    //Crea vista de de ARView. Solo se ejecuta 1 cez
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        context.coordinator.view = arView
        context.coordinator.setup()
        
        return arView
    }
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Cordinator {
        return Coordinator()
    }    
}


