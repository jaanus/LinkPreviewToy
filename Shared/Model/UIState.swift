//
//  State.swift
//  LinkPreviewToy
//
//  Created by Jaanus Kase on 05.01.2022.
//

import Foundation
import LinkPresentation

/// State of the URL loading.
enum UIState {
    
    /// Initial state. App is idle, nothing entered yet.
    case idle
    
    /// User has input a somewhat valid URL, and loading the preview for it is in progress.
    case loading(URL)
    
    /// There was an error loading a preview for this given URL.
    case error(URL, LPError)
    
    /// The preview metadata was loaded successfully.
    case loaded(LPLinkMetadata)
}
