//
//  Model.swift
//  LinkPreviewToy
//
//  Created by Jaanus Kase on 05.01.2022.
//

import Combine
import Foundation

class Model: ObservableObject {
    
    @Published private(set) var state = UIState.idle
    
    func startLoadingURL(_ url: URL) {
        state = .loading
    }
}
