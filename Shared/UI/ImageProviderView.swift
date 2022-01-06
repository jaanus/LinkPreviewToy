//
//  ImageProviderView.swift
//  LinkPreviewToy
//
//  Created by Jaanus Kase on 06.01.2022.
//

import SwiftUI
import LinkPresentation

struct ImageProviderView: View {
    
    @ObservedObject var viewModel: ItemProviderViewModel
    
    var body: some View {
        
        if let image = viewModel.nativeImage {
            #if os(macOS)
            Image(nsImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 256, height: 256)
                .background(Color.gray)
                .onDrag {
                    // Can drag out, but this doesn’t let you save… fixme.
                    viewModel.itemProvider
                }
            #else
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 256, height: 256)
                .background(Color.gray)
            #endif
        } else {
            Text("Loading…")
                .onAppear {
                    viewModel.loadImage()
                }
        }
        
    }
}

struct ImageProviderView_Previews: PreviewProvider {
    static var previews: some View {
        
        let previewData = try! Data(contentsOf: Bundle.main.url(forResource: "BBCLinkPreview", withExtension: "data")!)
        let metadata = try! NSKeyedUnarchiver.unarchivedObject(ofClass: LPLinkMetadata.self, from: previewData)!
        
        ImageProviderView(viewModel: ItemProviderViewModel(provider: metadata.imageProvider!))
            .frame(width: 512, height: 512)
    }
}
