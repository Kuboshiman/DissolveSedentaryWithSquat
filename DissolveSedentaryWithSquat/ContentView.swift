//
//  ContentView.swift
//  DissolveSedentaryWithSquat
//
//  Created by arakawaLab on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
    var noiseMaker = MakeNoize()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button(action: {
                noiseMaker.play()
            }, label: {
                Text("start")
            })
            Button(action: {
                noiseMaker.stop()
            }, label: {
                Text("stop")
            })

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
