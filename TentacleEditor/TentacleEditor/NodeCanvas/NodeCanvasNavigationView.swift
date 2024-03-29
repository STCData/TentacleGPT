//
//  NodeCanvasNavigationView.swift
//  ShaderNodeEditor
//
//  Created by fincher on 4/17/22.
//

import SwiftUI
import SpriteKit

struct NodeCanvasNavigationView: View {
    
    @State var nodeCanvasData = NodeCanvasData()
    @EnvironmentObject var environment : Environment
    var indicating : Binding<Bool> = .init {
        let environment = EnvironmentManager.shared.environment
        return environment.toggleDocPanel || environment.toggleLivePanel
    } set: { _, _ in
        
    }

    var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: 8) {
                if environment.toggleDocPanel {
                    NodeCanvasTitleIndicatorView(title: "Documentation", indicating: indicating, childView:Text("hi"))
                        .layoutPriority(1)
                }
                NodeCanvasTitleIndicatorView(title: "Editor", indicating: indicating, childView: NodeCanvasView())
                    .layoutPriority(1)
                if environment.toggleLivePanel {
                    NodeCanvasTitleIndicatorView(title: "Live", indicating: indicating, childView:Text("hi2"))
                        .layoutPriority(0)
                }
            }
            .padding(.all, 8)
            NodeCanvasToolbarView()
        }
        .animation(.easeInOut, value: environment.toggleDocPanel)
        .animation(.easeInOut, value: environment.toggleLivePanel)
        .environmentObject(nodeCanvasData)
        .navigationViewStyle(.stack)
    }
}

struct NodeCanvasNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NodeCanvasNavigationView()
    }
}
