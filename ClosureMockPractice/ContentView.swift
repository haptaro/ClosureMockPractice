//
//  ContentView.swift
//  ClosureMockPractice
//
//  Created by Kotaro Fukuo on 2022/07/17.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewStates = ViewStates(client: .live)
    
    var body: some View {
        VStack {
            Text("Result: \(viewStates.result)")
        }
        .task {
            await viewStates.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
