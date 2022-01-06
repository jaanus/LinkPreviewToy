//
//  ItemProviderViewModel.swift
//  LinkPreviewToy
//
//  Created by Jaanus Kase on 06.01.2022.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

#if os(macOS)
typealias NativeImage = NSImage
#else
typealias NativeImage = UIImage
#endif

/// Takes NSItemProvider and massages its output into something that is more consumable by SwiftUI.
class ItemProviderViewModel: ObservableObject {
    
    private let itemProvider: NSItemProvider

    @Published private(set) var nativeImage: NativeImage?
    
    init(provider: NSItemProvider) {
        itemProvider = provider
    }
    
    func loadImage() {
        itemProvider.loadItem(forTypeIdentifier: UTType.image.identifier, options: nil) { item, error in
            
            // https://mjtsai.com/blog/2016/11/09/nsitemproviders-nssecurecoding-reflection/ 🤮
            
            guard let item = item as? Data else { return }
            let image = NativeImage(data: item)
            DispatchQueue.main.async {
                self.nativeImage = image
            }
        }
    }
    
}
