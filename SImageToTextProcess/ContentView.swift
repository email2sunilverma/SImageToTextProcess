//
//  ContentView.swift
//  SImageToTextProcess
//
//  Created by Sunil Verma on 29/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var imageText: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Button("Process Image") {
                if let image = UIImage(named: "EmailImg") {
                    SImageProcessor.processImage(image: image) { results in
                        if let text = results?.joined(separator: ", ") {
                            imageText = text
                        }
                    }
                }
            }
            
            Button("Process  Async Image") {
                Task {
                    if let image = UIImage(named: "ImageWithText") {
                        let results = try? await SImageProcessor.processImage(in: image)
                        if let text = results?.joined(separator: ", ") {
                            imageText = text
                        }
                    }
                }
            }
            
            Text(imageText)
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
