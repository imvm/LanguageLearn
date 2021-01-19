//
//  Exercise.swift
//  LanguageLearn
//
//  Created by Ian Manor on 18/10/20.
//

protocol Exercise {
    var count: Int { get set }
}

struct GrammarExercise: Exercise {
    var count: Int
}

struct VocabularyExercise: Exercise {
    var count: Int
}

struct ListeningExercise: Exercise {
    var count: Int
}

struct SpeakingExercise: Exercise {
    var count: Int
}

struct ReadingExercise: Exercise {
    var count: Int
}
