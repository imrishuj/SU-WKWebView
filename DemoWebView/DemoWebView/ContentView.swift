//
//  ContentView.swift
//  DemoWebView
//
//  Created by Rishabh on 18/06/20.
//  Copyright © 2020 Rishabh. All rights reserved.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    @State private var urlString = ""
    @State private var shouldHide = false
    
    var body: some View {
        
        VStack {
            
            CustomWKWebView(urlString: self.$urlString)
            
            if !shouldHide {

                Button(action: {
                    self.urlString = "https://www.apple.com"
                    self.shouldHide = true
                }) {
                    Text("Open WebPage")
                }
            }
        }
    }
}

struct CustomWKWebView: UIViewRepresentable {
    
    @Binding var urlString: String
        
    func makeUIView(context: Context) -> WKWebView  {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        if let url = URL(string: self.urlString) {
            uiView.load(URLRequest(url: url))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
