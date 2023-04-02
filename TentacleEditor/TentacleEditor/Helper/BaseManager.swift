//
//  BaseManager.swift
//  TentacleEditor
//
//  Created by standard on 4/2/23.
//

import Foundation

public class BaseManager : NSObject {
    class var shared : BaseManager {
        return BaseManager()
    }
    
    func setup() -> Void {
        
    }
    
    func destroy() -> Void {
        
    }
}
