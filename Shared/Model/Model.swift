//
//  Model.swift
//  LinkPreviewToy
//
//  Created by Jaanus Kase on 05.01.2022.
//

import Combine
import Foundation
import LinkPresentation

class Model: ObservableObject {
    
    @Published private(set) var state = UIState.idle
        
    func startLoadingURL(_ url: URL) {
        state = .loading(url)
        LPMetadataProvider().startFetchingMetadata(for: url) { metadata, error in
            print("Fetched. Metadata: \(String(describing: metadata)), error: \(String(describing: error))")
        }
    }
}
