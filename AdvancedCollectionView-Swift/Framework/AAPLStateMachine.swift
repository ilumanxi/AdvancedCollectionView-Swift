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
    
    
    private static let AAPLStateNil = "Nil"
    
    private var _lock: OSSpinLock
    
    public var currentState: String? {
        
        get {
            
            var currentState: String?
            OSSpinLockLock(&_lock)
            currentState = self.currentState
            OSSpinLockUnlock(&_lock)
            return currentState
        }
        
        set {
            
            self.currentState = newValue
        }
    }
    
    public var validTransitions:[String:Array<String>]
    
    public weak var delegate: AAPLStateMachineDelegate?
    
    public var shouldLogStateTransitions: Bool
    
    public override init() {
        
        _lock = OS_SPINLOCK_INIT
        validTransitions = [:]
        shouldLogStateTransitions = false
        super.init()
        currentState = nil
    }
    

    private func target() -> AnyObject {
    
        guard let delegate = self.delegate else {
            
            return self
        }
    
        return delegate
    }
    
    
    
    public func applyState(toState: String) -> Bool {
        
        let fromState = currentState
        
        if shouldLogStateTransitions {
            
            print(" ••• request state change from \(fromState) to \(toState)")
        }
    }
    
    
    private func attemptToSetCurrentState(toState: String) {
        
        
    }
    
    public func missingTransition(from fromState: String, to toState: String) -> String? {
        
    }
    
    private func validateTransition(from fromState: String,  to toState: String) -> String {
        
        
    }
    
    private func performTransition(from fromState: String?, to toState: String) {
        
        if shouldLogStateTransitions {
            
            print("  ••• \(fromState) state change from %@ to \(toState)")
        }
        
        let target = self.target() as! NSObjectProtocol
        
        if let fromState = fromState {
            
            let exitStateAction = NSSelectorFromString("didExit\(fromState)")
            
            if target.responds(to: exitStateAction) {
                
                target.perform(exitStateAction)
            }
        }
        
        let enterStateAction = NSSelectorFromString("didEnter\(toState)")
        if target.responds(to: enterStateAction) {
            
            target.perform(enterStateAction)
        }
        
        
        let fromStateNotNil = fromState ?? AAPLStateMachine.AAPLStateNil
        
        let transitionAction = NSSelectorFromString("stateDidChangeFrom%\(fromStateNotNil)To\(toState)")
        
        if target.responds(to: transitionAction) {
            
            target.perform(transitionAction)
        }
        
        let genericDidChangeAction = NSSelectorFromString("stateDidChange")
        
        if target.responds(to: genericDidChangeAction) {
            target.perform(genericDidChangeAction)
        }
   
    }
}
