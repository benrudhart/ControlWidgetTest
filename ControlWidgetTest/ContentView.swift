//
//  ContentView.swift
//  ControlWidgetTest
//
//  Created by Ben Rudhart on 18.02.26.
//

import SwiftUI

struct ContentView: View {
    @AppStorage(UserDefaults.isOnKey, store: .appGroup) private var isOn = false

    var body: some View {
        VStack {
            Toggle("Control value", isOn: $isOn)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
