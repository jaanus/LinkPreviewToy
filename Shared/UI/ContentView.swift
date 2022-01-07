//
//  ContentView.swift
//  Shared
//
//  Created by Jaanus Kase on 05.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var model = Model()
    
    var body: some View {
        VStack {
            URLInputView(model: model)
            
            switch model.state {
                
            case .idle:
                Text("Enter a URL to see its preview.")
                    .padding()
            
            case .loading(let url):
                ProgressView("Loading \(url.absoluteString)…")
                    .padding()
                
            case .loaded(let metadata):
                LinkMetadataView(metadata: metadata)
                
            case .error(let url, let error):
                ErrorView(url: url, error: error)
                
            }
            
            Spacer()
        }
        .padding()
    }
}

#if DEBUG
import LinkPresentation
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let url = URL(string: "https://www.bbc.com/future/article/20220105-what-existed-before-the-big-bang")!
        let previewData = try! Data(contentsOf: Bundle.main.url(forResource: "BBCLinkPreview", withExtension: "data")!)
        let metadata = try! NSKeyedUnarchiver.unarchivedObject(ofClass: LPLinkMetadata.self, from: previewData)!
        let error = LPError(.metadataFetchFailed, userInfo: [:])
        
        return Group {
            ContentView(model: Model(testState: .idle))
            ContentView(model: Model(testState: .loading(url)))
            ContentView(model: Model(testState: .loaded(metadata)))
            ContentView(model: Model(testState: .error(url, error)))
        }
    }
}
#endif
