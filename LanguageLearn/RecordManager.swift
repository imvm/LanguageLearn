//
//  RecordManager.swift
//  LanguageLearn
//
//  Created by Ian Manor on 18/10/20.
//

final class RecordingManager {
    let recognizer = SpeechRecognizer()

    func startSpeechRecognition(completion: @escaping (String?) -> ()) {
        recognizer.startRecording(completion: completion)
    }

    func stopSpeechRecognition() -> String {
        return recognizer.stopRecording() ?? ""
    }
}
