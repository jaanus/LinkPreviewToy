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
            // Callback arrives on the background queue. Change state back on the main queue.
            DispatchQueue.main.async {
                if let error = error as? LPError {
                    self.state = .error(url, error)
                }
                
                if let metadata = metadata {
                    self.state = .loaded(metadata)
                }
            }
        }
    }
}
