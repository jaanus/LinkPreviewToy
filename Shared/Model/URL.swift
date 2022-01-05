//
//  URL.swift
//  LinkPreviewToy
//
//  Created by Jaanus Kase on 05.01.2022.
//

import Foundation

extension URL {    
    static func loadableURLForString(_ s: String) -> URL? {
        guard let url = URL(string: s),
              url.scheme == "https",
              url.host != nil else { return nil }
        return url
    }
}
