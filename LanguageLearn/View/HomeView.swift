//
//  HomeView.swift
//  LanguageLearn
//
//  Created by Ian Manor on 18/10/20.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    let exerciseTypes = ExerciseType.allCases

    var body: some View {
        NavigationView {
            List(0..<exerciseTypes.count) { index in
                NavigationLink(destination: ExerciseTypeView(type: exerciseTypes[index])) {
                    HStack {
                        Image(systemName: exerciseTypes[index].symbolName)
                        Text("\(exerciseTypes[index].rawValue) exercises".capitalized)
                    }
                }
            }
            .padding(.top, 10)
            .navigationBarTitle("LanguageLearn")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        viewModel.showSettings = true
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
            }
            .sheet(isPresented: $viewModel.showSettings) {
                SettingsView()
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
