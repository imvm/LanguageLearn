//
//  Tagger.swift
//  LanguageLearn
//
//  Created by Ian Manor on 26/09/20.
//

import NaturalLanguage

struct HiddenWord {
    var range: Range<String.Index>
    var value: String
    var tag: NLTag
}

final class Tagger {
    static func tag(text: String) -> [HiddenWord] {
        let tagger = NLTagger(tagSchemes: [.lexicalClass])
        let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace]
        tagger.string = text

        return tagger.tags(in: text.startIndex..<text.endIndex,
                           unit: .sentence,
                           scheme: .lexicalClass,
                           options: options)
            .filter { $0.0 == .verb }
            .map { tag, range in
                HiddenWord(range: range, value: String(text[range]), tag: tag!)
            }
    }
}

extension String {
    func removing(words: [HiddenWord]) -> String {
        return "Mein _____ sagt die Deutschen _____ viel rot Bier."
    }
}
