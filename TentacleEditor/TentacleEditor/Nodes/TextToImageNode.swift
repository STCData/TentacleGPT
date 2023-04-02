//
//  TextToImageNode.swift
//  TentacleEditor
//
//  Created by standard on 4/2/23.
//

import Foundation
// import SpriteKit
import SwiftUI

class TextToImageNode: NodeData {
    override class func getDefaultCategory() -> String {
        "GPT"
    }

    override class func getDefaultTitle() -> String {
        "Text To Image"
    }

    override class func getDefaultPerformImplementation() -> ((NodeData) -> Void) {
        return { nodeData in
            if let nodeData = nodeData as? TextToImageNode {
                print("\(nodeData.prompt)")
            }
            nodeData.outControlPorts[safe: 0]?.connections[safe: 0]?.endPort?.nodeData?.perform()
        }
    }

    override class func getDefaultControlInPorts() -> [NodeControlPortData] {
        return [
            NodeControlPortData(portID: 0, name: "input", direction: .input),
            NodeControlPortData(portID: 1, name: "prompt", direction: .input),
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
                    if let node = node as? TextToImageNode {
                        return node.prompt
                    } else { return "" }
                }, set: { newValue in
                    if let node = node as? TextToImageNode {
                        node.prompt = newValue
                    }
                }), prompt: Text("prompt"), axis: .vertical)
                    .textFieldStyle(.roundedBorder)

                AsyncImage(url: URL(string: "https://picsum.photos/240/200"))
            }
            .font(.caption.monospaced())
            .frame(minWidth: 120, maxWidth: 280, alignment: .center)
        )
    }
}
