//
//  LinkMetadataView.swift
//  LinkPreviewToy
//
//  Created by Jaanus Kase on 06.01.2022.
//

import SwiftUI
import LinkPresentation

struct LinkMetadataView: View {
    
    let metadata: LPLinkMetadata
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Extracted data:")
                .font(.caption)
                .padding(.top)
            
            Text("URL: \(metadata.url?.absoluteString ?? "unknown")")
            Text("Original URL: \(metadata.originalURL?.absoluteString ?? "unknown")")
            Text("Title: \(metadata.title ?? "none")")
            
            if let iconProvider = metadata.iconProvider {
                Text("Has icon")
            } else {
                Text("No icon")
            }
            
            if let imageProvider = metadata.imageProvider {
                Text("Has image")
            } else {
                Text("No image")
            }
            
            Text("Video URL: \(metadata.remoteVideoURL?.absoluteString ?? "none")")
                 
            if let videoProvider = metadata.videoProvider {
                Text("Has video")
            } else {
                Text("No video provider")
            }
            

        }
    }
}

struct LinkMetadataView_Previews: PreviewProvider {
    static var previews: some View {
        
        let previewData = try! Data(contentsOf: Bundle.main.url(forResource: "BBCLinkPreview", withExtension: "data")!)
        let metadata = try! NSKeyedUnarchiver.unarchivedObject(ofClass: LPLinkMetadata.self, from: previewData)!
        
        LinkMetadataView(metadata: metadata)
    }
}
