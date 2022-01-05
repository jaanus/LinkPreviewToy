//
//  ContentView.swift
//  Shared
//
//  Created by Jaanus Kase on 05.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var model = Model()
    
    var body: some View {
        VStack {
            URLInputView(model: model)
            
            switch model.state {
            case .idle:
                Text("Enter a URL to see its preview.")
                    .padding()
            case .loading:
                ProgressView("Loading…")
                    .padding()
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
