//
//  LPLinkViewView.swift
//  LinkPreviewToy (macOS)
//
//  Created by Jaanus Kase on 07.01.2022.
//

import Foundation
import SwiftUI
import LinkPresentation

struct LPLinkViewView: UIViewRepresentable {
    
    let metadata: LPLinkMetadata
    
    func makeUIView(context: Context) -> some UIView {
        let view = LPLinkView(metadata: metadata)
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }    
}
