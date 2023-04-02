//
//  ContentView.swift
//  TentacleEditor
//
//  Created by standard on 4/2/23.
//

import SwiftUI

struct ContentView: View {
    
    let nodeCanvasData = NodeCanvasData()
    var body: some View {
        NodeCanvasNavigationView()
            .environmentObject(EnvironmentManager.shared.environment)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
