//
//  ExerciseDatabase.swift
//  LanguageLearn
//
//  Created by Ian Manor on 18/10/20.
//

import Foundation

final class ExerciseDatabase {
    static func exercises(type: ExerciseType, level: LanguageLevel) -> [Exercise] {
        switch type {
            case .grammar:
                return Array.init(repeating: GrammarExercise(count: .random(in: 1...5)), count: .random(in: 1...5))
            case .vocabulary:
                return Array.init(repeating: VocabularyExercise(count: .random(in: 1...5)), count: .random(in: 1...5))
            case .speaking:
                return Array.init(repeating: SpeakingExercise(count: .random(in: 1...5)), count: .random(in: 1...5))
            case .listening:
                return Array.init(repeating: ListeningExercise(count: .random(in: 1...5)), count: .random(in: 1...5))
            case .reading:
                return Array.init(repeating: ReadingExercise(count: .random(in: 1...5)), count: .random(in: 1...5))
        }
    }
}
