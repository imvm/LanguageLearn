//
//  ExerciseTypeView.swift
//  LanguageLearn
//
//  Created by Ian Manor on 18/10/20.
//

import SwiftUI

struct ExerciseTypeView: View {
    let type: ExerciseType
    let levels = LanguageLevel.allCases

    var body: some View {
        ScrollView {
            ForEach(0..<levels.count) { index in
                levelCard(for: levels[index])
            }
            .padding(10)
        }
        .padding(.top, 10)
        .background(Color(.secondarySystemBackground))
        .navigationBarTitle(type.rawValue.capitalized, displayMode: .inline)
    }

    private func levelCard(for level: LanguageLevel) -> some View {
        VStack {
            Text(level.rawValue)
                .font(.headline)
            row(with: ExerciseDatabase.exercises(type: type, level: level))
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 6)
                        .foregroundColor(Color(.systemBackground))
        )
        .shadow(radius: 1)
    }

    private func row(with exercises: [Exercise]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, alignment: .top) {
                ForEach(0..<exercises.count) { index in
                    ExerciseCell(exercise: exercises[index])
                }
            }
        }
    }

    private var gridLayout: [GridItem] {
        [GridItem(.adaptive(minimum: 82, maximum: 82))]
    }
}
