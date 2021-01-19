//
//  CircleImageButton.swift
//  LanguageLearn
//
//  Created by Ian Manor on 18/10/20.
//

import SwiftUI

struct CircleImageButton: View {
    @State var radius: CGFloat = 44
    @State var systemName: String
    @State var color: Color

    var body: some View {
        Image(systemName: systemName)
            .frame(width: radius, height: radius)
            .foregroundColor(color)
            .background(Color(.systemBackground))
            .clipShape(Circle())
            .shadow(radius: 2)
    }
}
