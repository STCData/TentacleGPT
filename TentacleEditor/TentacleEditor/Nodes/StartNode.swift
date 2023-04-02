//
//  StartNode.swift
//  ScriptNode
//
//  Created by fincher on 4/21/22.
//

import Foundation

class StartNode: NodeData {
    override class func getDefaultExposedToUser() -> Bool {
        false
    }

    override class func getDefaultTitle() -> String {
        "Start"
    }

    override class func getDefaultControlOutPorts() -> [NodeControlPortData] {
        return [
            NodeControlPortData(portID: 0, name: "", direction: .output),
        ]
    }
}
