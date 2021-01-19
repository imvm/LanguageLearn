//
//  ExerciseView.swift
//  LanguageLearn
//
//  Created by Ian Manor on 26/09/20.
//

import SwiftUI
import SwiftUIX

struct ExerciseView: View {
    let synthesizer = SpeechSynthesizer()
    let text = "Mein Vater sagt die Deutschen trinken viel rot Bier."
    let hiddenWords: [HiddenWord]

    init() {
        self.hiddenWords = Tagger.tag(text: text)
    }

    var body: some View {
        ZStack {
            Color(.secondarySystemBackground).ignoresSafeArea()
            VStack(spacing: 10) {
                textCard
                /*
                ForEach(0..<hiddenWords.count) { index in
                    Text(hiddenWords[index].value)
                }
                */
                RecordButtonView {
                    print("recognized \($0)")
                }
                Spacer()
            }
            .padding(.top, 10)
        }
    }

    var textCard: some View {
        HStack {
            Text(text.removing(words: hiddenWords))
                .padding()
            Button {
                synthesizer.speak(text: text)
            } label: {
                Image(systemName: "speaker.2")
                    .frame(width: 44, height: 44)
            }
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(Color(.systemBackground))
                .shadow(radius: 1)
        )
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}
