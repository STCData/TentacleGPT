//
//  RandomNode.swift
//  ScriptNode
//
//  Created by fincher on 4/24/22.
//

import Foundation
import SpriteKit

class RandomNode: NodeData {
    override class func getDefaultCategory() -> String {
        "ZTools"
    }

    override class func getDefaultTitle() -> String {
        "Generate Random 🎲"
    }

    override class func getDefaultPerformImplementation() -> ((NodeData) -> Void) {
        return { nodeData in
            if let port1 = nodeData.outDataPorts[safe: 0] as? CGFloatNodeDataPort {
                port1.value = CGFloat.random(in: -90 ... 90)
            }
            nodeData.outControlPorts[safe: 0]?.connections[safe: 0]?.endPort?.nodeData?.perform()
        }
    }

    override class func getDefaultControlInPorts() -> [NodeControlPortData] {
        return [
            NodeControlPortData(portID: 0, name: "", direction: .input),
        ]
    }

    override class func getDefaultControlOutPorts() -> [NodeControlPortData] {
        return [
            NodeControlPortData(portID: 0, name: "", direction: .output),
        ]
    }

    override class func getDefaultDataOutPorts() -> [NodeDataPortData] {
        return [
            CGFloatNodeDataPort(portID: 0, name: "Random", direction: .output),
        ]
    }
}
