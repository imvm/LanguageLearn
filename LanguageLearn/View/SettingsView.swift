//
//  SettingsView.swift
//  LanguageLearn
//
//  Created by Ian Manor on 18/10/20.
//

import SwiftUI

struct SettingsView: View {
    @State var optionIsOn = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Options")) {
                    HStack {
                        Toggle(isOn: $optionIsOn) {
                            Text("Option A")
                        }
                    }
                }
                Section(header: Text("Subscriptions")) {
                    Text("Option B")
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
        }
    }
}
