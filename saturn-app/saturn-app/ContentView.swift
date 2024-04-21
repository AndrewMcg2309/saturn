//
//  ContentView.swift
//  saturn-app
//
//  Created by andrew.mcgowan on 4/20/24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Saturn App")
            
            Button(action: AwsStart) {
                Text("Start Instance")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
