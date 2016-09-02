//
//  AAPLAction.swift
//  AdvancedCollectionView-Swift
//
//  Created by Tanfanfan on 16/9/1.
//  Copyright © 2016年 Tanfanfan. All rights reserved.
//

import Foundation


public class AAPLAction: NSObject{
    
    
    public let title: String
    
    public let selector: Selector
    
    public private(set) var destructive: Bool {
        
        @objc(isDestructive) get {
            
            return self.destructive
        }
        
        set {
            
           self.destructive = newValue
        }
    }
    
    
   public init(title: String, selector: Selector,destructive: Bool) {
        
        self.title = title
        self.selector = selector
        super.init()
        self.destructive = destructive
      
    }
    
    public convenience init(title: String, selector: Selector) {
        
        self.init(title: title,selector: selector,destructive: false)
    }
    
}
