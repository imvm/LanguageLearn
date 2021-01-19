//
//  SpeechSynthesizer.swift
//  LanguageLearn
//
//  Created by Ian Manor on 18/10/20.
//

import AVFoundation

final class SpeechSynthesizer {
    private let synthesizer = AVSpeechSynthesizer()

    func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        synthesizer.speak(utterance)
    }
}
