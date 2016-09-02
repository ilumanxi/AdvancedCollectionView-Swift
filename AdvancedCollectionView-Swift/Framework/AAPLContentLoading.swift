//
//  AAPLContentLoading.swift
//  AdvancedCollectionView-Swift
//
//  Created by Tanfanfan on 16/9/1.
//  Copyright © 2016年 Tanfanfan. All rights reserved.
//

import Foundation

enum AAPLLoadState: String {
    
    case initial = "Initial" /// The initial state.
    
    case loadingContent = "LoadingState" /// The first load of content.
    
    case refreshingContent = "RefreshingState" /// Subsequent loads after the first.
    
    case contentLoaded = "LoadedState" /// After content is loaded successfully.
    
    case noContent = "NoContentState" /// No content is available.
    
    case error = "ErrorState" /// An error occurred while loading content.
}


let AAPLLoadStateInitial = "Initial";
let AAPLLoadStateLoadingContent = "LoadingState";
let AAPLLoadStateRefreshingContent = "RefreshingState";
let AAPLLoadStateContentLoaded = "LoadedState";
let AAPLLoadStateNoContent = "NoContentState";
let AAPLLoadStateError = "ErrorState";


/// A block that performs updates on the object that is loading. The object parameter is the receiver of the `-loadContentWithProgress:` message.
typealias AAPLLoadingUpdateBlock = (AnyObject) -> Void
