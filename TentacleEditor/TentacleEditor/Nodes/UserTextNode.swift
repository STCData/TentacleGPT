//
//  UserTextNode.swift
//  TentacleEditor
//
//  Created by standard on 4/2/23.
//

import Foundation
// import SpriteKit
import SwiftUI

class UserTextNode: NodeData {
    override class func getDefaultCategory() -> String {
        "GPT"
    }

    override class func getDefaultTitle() -> String {
        "User Text"
    }

    override class func getDefaultPerformImplementation() -> ((NodeData) -> Void) {
        return { nodeData in
            if let nodeData = nodeData as? UserTextNode {
                print("\(nodeData.prompt)")
            }
            nodeData.outControlPorts[safe: 0]?.connections[safe: 0]?.endPort?.nodeData?.perform()
        }
    }

    override class func getDefaultControlInPorts() -> [NodeControlPortData] {
        return [
        ]
    }

    override class func getDefaultControlOutPorts() -> [NodeControlPortData] {
        return [
            NodeControlPortData(portID: 0, name: "output", direction: .output),
        ]
    }

    var prompt: String = ""

    override class func getDefaultCustomRendering(node: NodeData) -> AnyView? {
        return AnyView(
            VStack {
                Text("prompt")
                TextField("prompt", text: .init(get: { () -> String in
                    if let node = node as? UserTextNode {
                        return node.prompt
                    } else { return "" }
                }, set: { newValue in
                    if let node = node as? UserTextNode {
                        node.prompt = newValue
                    }
                }), prompt: Text("prompt"), axis: .vertical)
                    .textFieldStyle(.roundedBorder)

                Button("SUBMIT") {}
                    .foregroundColor(.black)
                    .padding(.top, 8)
                    .padding(.bottom, 8)
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .background(.green)
                    .cornerRadius(13)
            }
            .font(.caption.monospaced())
            .frame(minWidth: 120, maxWidth: 380, alignment: .center)
        )
    }
}
