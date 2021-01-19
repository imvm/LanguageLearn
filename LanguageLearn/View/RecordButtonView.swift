//
//  RecordButtonView.swift
//  LanguageLearn
//
//  Created by Ian Manor on 18/10/20.
//

import SwiftUI

struct RecordButtonView: View {
    @State private var isRecording = false
    private let recordingManager = RecordingManager()
    let onRecognize: (String) -> ()

    var body: some View {
        if !isRecording {
            startRecordingButton
        } else {
            stopRecordingButton
        }
    }

    var startRecordingButton: some View {
        Button {
            recordingManager.startSpeechRecognition {
                print("error \($0 ?? "nil")")
            }
        } label: {
            CircleImageButton(systemName: "mic.fill", color: Color(.systemBlue))
        }
    }

    var stopRecordingButton: some View {
        Button {
            onRecognize(recordingManager.stopSpeechRecognition())
        } label: {
            CircleImageButton(systemName: "mic.slash.fill", color: Color(.systemRed))
        }
    }
}
