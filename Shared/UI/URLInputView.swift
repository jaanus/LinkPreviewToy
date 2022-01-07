//
//  URLInputView.swift
//  LinkPreviewToy
//
//  Created by Jaanus Kase on 05.01.2022.
//

import SwiftUI

struct URLInputView: View {
    
    let model: Model
    
    @State private var urlString: String = "https://example.com"
    
    var body: some View {
        HStack {
            TextField("URL to preview", text: $urlString)
                .onSubmit {
                    startLoadingPreview()
                }
            
            Button("Go") {
                startLoadingPreview()
            }
            .disabled(!enteredURLIsLoadable)
        }
    }
    
    private func startLoadingPreview() {
        guard let url = URL.loadableURLForString(urlString) else { return }
        model.startLoadingURL(url)
    }
    
    private var enteredURLIsLoadable: Bool {
        return URL.loadableURLForString(urlString) != nil
    }
    
}

struct URLInputView_Previews: PreviewProvider {
    static var previews: some View {
        URLInputView(model: Model())
    }
}
