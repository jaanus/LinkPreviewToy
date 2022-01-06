//
//  ErrorView.swift
//  LinkPreviewToy
//
//  Created by Jaanus Kase on 06.01.2022.
//

import SwiftUI
import LinkPresentation

struct ErrorView: View {
    
    let url: URL
    let error: LPError
    
    var body: some View {
        HStack(spacing: 0) {
            
            VStack(alignment: .leading) {
                Text("Error loading preview for \(url.absoluteString):")
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.top)
                
                ScrollView {
                    Text(String(describing: error))
                        .font(.system(.body, design: .monospaced))
                        .textSelection(.enabled)
                        .padding(4)
                }
                .cornerRadius(4)
                .overlay(RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.gray, lineWidth: 1))
            }
            
            // The aim of HStack with trailing spacer is to make the leading edge
            // of the VStack to not flicker when resizing macOS window.
            // With this approach, you still see the flicker on the
            // trailing edge, when resizing macOS window,
            // but the leading edge stays aligned.
            // I can’t think of a simple way to cleanly align both edges.
            // Let me know if there is a good way.
            // One way to fix the flicker would be to change the UI design
            // so the error box wouldn’t have a background or border,
            // and the flicker is not visible on the trailing side.
            Spacer(minLength: 0)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        
        let url = URL(string: "http://example.com/someProblemURL")!
        let error = LPError(.metadataFetchFailed, userInfo: [:])
        
        ErrorView(url: url, error: error)
    }
}
