//
//  LPLinkViewView.swift
//  LinkPreviewToy (macOS)
//
//  Created by Jaanus Kase on 07.01.2022.
//

import Foundation
import SwiftUI
import LinkPresentation

struct LPLinkViewView: NSViewRepresentable {
    
    let metadata: LPLinkMetadata
    
    func makeNSView(context: Context) -> some NSView {
        let view = LPLinkView(metadata: metadata)
        return view
    }
    
    func updateNSView(_ nsView: NSViewType, context: Context) {
        
    }    
}
