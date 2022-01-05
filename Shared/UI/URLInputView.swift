//
//  URLInputView.swift
//  LinkPreviewToy
//
//  Created by Jaanus Kase on 05.01.2022.
//

import SwiftUI

struct URLInputView: View {
    
    let model: Model
    
    @State private var urlString: String = ""
    
    var body: some View {
        HStack {
            TextField("URL to preview", text: $urlString, onCommit: {
                startLoadingPreview()
            })
            Button("Go") {
                startLoadingPreview()
            }
            .disabled(URL.loadableURLForString(urlString) == nil)
        }
    }
    
    private func startLoadingPreview() {
        guard let url = URL.loadableURLForString(urlString) else { return }
        model.startLoadingURL(url)
    }
    
}

struct URLInputView_Previews: PreviewProvider {
    static var previews: some View {
        URLInputView(model: Model())
    }
}
