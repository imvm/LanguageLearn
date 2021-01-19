//
//  HomeViewModel.swift
//  LanguageLearn
//
//  Created by Ian Manor on 18/10/20.
//

import Foundation

struct Category {
    var title: String
    var exercises: [String]
}

enum ExerciseType: String, CaseIterable {
    case grammar
    case vocabulary
    case speaking
    case listening
    case reading

    var symbolName: String {
        switch self {
        case .grammar:
            return "scroll"
        case .vocabulary:
            return "a.book.closed"
        case .speaking:
            return "mouth"
        case .listening:
            return "ear"
        case .reading:
            return "eye"
        }
    }
}

final class HomeViewModel: ObservableObject {
    @Published var showSettings = false
}
