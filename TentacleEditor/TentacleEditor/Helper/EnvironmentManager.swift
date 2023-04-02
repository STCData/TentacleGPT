//
//  EnvironmentManager.swift
//  ShaderNodeEditor
//
//  Created by fincher on 4/17/22.
//

import Foundation




public func setupAllBaseManagers() -> Void {
    let list = subclasses(of: BaseManager.self)
    list.forEach { (manager) in
        manager.shared.setup()
    }
}


public func destroyAllBaseManagers() -> Void {
    let list = subclasses(of: BaseManager.self)
    list.forEach { (manager) in
        manager.shared.destroy()
    }
}


class EnvironmentManager : BaseManager {
    
    static let instance = EnvironmentManager()
    
    override class var shared: EnvironmentManager {
        return instance
    }
    
    let environment : Environment = Environment()
    
    override func setup() {
        
    }
    
    override func destroy() {
        
    }
}
