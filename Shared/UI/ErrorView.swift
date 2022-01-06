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
        VStack(alignment: .leading) {
            Text("Error loading preview for \(url.absoluteString)")
                .font(.caption)
            Text(String(describing: error))
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
