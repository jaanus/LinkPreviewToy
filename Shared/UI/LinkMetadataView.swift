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
    
    @State private var showPreview = false
    
    var body: some View {
        
        ScrollView {
            
            HStack(spacing: 0) {
                VStack(alignment: .leading) {
                    
                    Group {
                        Text("URL")
                            .font(.caption)
                            .bold()
                            .padding(.top)
                        Text("\(metadata.url?.absoluteString ?? "unknown")")
                    }

                    Group {
                        Text("Original URL")
                            .font(.caption)
                            .bold()
                            .padding(.top, 4)
                        Text("\(metadata.originalURL?.absoluteString ?? "unknown")")
                    }

                    Group {
                        Text("Title")
                            .font(.caption)
                            .bold()
                            .padding(.top, 4)
                        Text("\(metadata.title ?? "none")")
                    }

                    Group {
                        Text("Icon")
                            .font(.caption)
                            .bold()
                            .padding(.top, 4)
                        if let iconProvider = metadata.iconProvider {
                            ImageProviderView(viewModel: ItemProviderViewModel(provider: iconProvider))
                        } else {
                            Text("No icon")
                        }
                    }
                    
                    Group {
                        Text("Image")
                            .font(.caption)
                            .bold()
                            .padding(.top, 4)
                        if let imageProvider = metadata.imageProvider {
                            ImageProviderView(viewModel: ItemProviderViewModel(provider: imageProvider))
                        } else {
                            Text("No image")
                        }
                    }
                    
                    Group {
                        Text("Video")
                            .font(.caption)
                            .bold()
                            .padding(.top, 4)
                    }
                    Text("\(metadata.remoteVideoURL?.absoluteString ?? "No video URL")")
                         
                    if metadata.videoProvider != nil {
                        Text("Has video provider")
                    } else {
                        Text("No video provider")
                    }
                    
                    if showPreview {
                        LPLinkViewView(metadata: metadata)
                    } else {
                        Button("Show preview") {
                            showPreview = true
                        }
                    }
                    
                }

                Spacer(minLength: 0)
            }

        }
        
    }
}

struct LinkMetadataView_Previews: PreviewProvider {
    static var previews: some View {
        
        // https://www.bbc.com/future/article/20220105-what-existed-before-the-big-bang
        let previewData = try! Data(contentsOf: Bundle.main.url(forResource: "BBCLinkPreview", withExtension: "data")!)
        let metadata = try! NSKeyedUnarchiver.unarchivedObject(ofClass: LPLinkMetadata.self, from: previewData)!
        
        LinkMetadataView(metadata: metadata)
    }
}
