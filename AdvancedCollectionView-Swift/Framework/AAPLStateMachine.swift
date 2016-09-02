//
//  AAPLStateMachine.swift
//  AdvancedCollectionView-Swift
//
//  Created by Tanfanfan on 16/9/1.
//  Copyright © 2016年 Tanfanfan. All rights reserved.
//

import Foundation
import UIKit


@objc public protocol AAPLStateMachineDelegate: NSObjectProtocol {
    
   
    @objc optional func stateWillChange() -> Void
    
    @objc optional func stateDidChange() -> Void
    
    @objc optional func missingTransiton(from fromState: String, to toState: String) -> String
}

public class AAPLStateMachine: NSObject {
    
    
    private var _lock: OSSpinLock
    
    public var currentState: String?
    
    public var validTransitions:[String:Array<String>]
    
    public weak var delegate: AAPLStateMachineDelegate?
    
    public var shouldLogStateTransitions: Bool
    
    public override init() {
        
        _lock = OS_SPINLOCK_INIT
        
        
    }
    

    
    public func applyState(state: String) -> Bool {
        
        
    }
    
    public func missingTransition(from fromState: String, to toState: String) -> String? {
        
    }
}
