//
//  SpeechRecognizer.swift
//  LanguageLearn
//
//  Created by Ian Manor on 18/10/20.
//

import Speech

final class SpeechRecognizer {
    public private(set) var isRecording = false
    private var audioEngine: AVAudioEngine!
    private var inputNode: AVAudioInputNode!
    private var audioSession: AVAudioSession!

    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?

    var recognizedString = ""

    // MARK: - Speech recognition
    func startRecording(completion: @escaping (String?) -> ()) {
        recognizedString = ""

        checkPermissions { hasPermission in
            guard hasPermission else {
                completion("Could not access permission")
                return
            }

            self.startRecognition(completion: completion)
        }
    }

    private func startRecognition(completion: @escaping (String?) -> ()) {
        guard let recognizer = SFSpeechRecognizer(), recognizer.isAvailable else {
            completion("Speech recognizer not available.")
            return
        }

        isRecording = true
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        recognitionRequest!.shouldReportPartialResults = true

        recognizer.recognitionTask(with: recognitionRequest!) { (result, error) in
            guard error == nil else { completion(error!.localizedDescription); return }
            guard let result = result else { return }
            self.recognizedString = result.bestTranscription.formattedString
        }

        audioEngine = AVAudioEngine()

        inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
            self.recognitionRequest?.append(buffer)
        }

        audioEngine.prepare()

        do {
            audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.record, mode: .spokenAudio, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            try audioEngine.start()
        } catch {
            completion(error.localizedDescription)
        }
    }

    func stopRecording() -> String? {
        guard isRecording else { return nil }
        recognitionRequest?.endAudio()
        recognitionRequest = nil

        audioEngine.stop()
        inputNode.removeTap(onBus: 0) // Call after audio engine is stopped as it modifies the graph.

        try? audioSession.setActive(false)
        audioSession = nil
        return recognizedString
    }

    // MARK: - Privacy
    private func checkPermissions(hasPermission: @escaping (Bool) -> ()) {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            switch authStatus {
                case .authorized: hasPermission(true)
                default: hasPermission(false)
            }
        }
    }
}
