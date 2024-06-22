//
//  ButtonView.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import SwiftUI

struct ButtonView: View {
    var buttonText: String
    var body: some View {
        Text(buttonText)
            .padding(6)
            .background (
                RoundedRectangle(cornerRadius: 3)
                    .stroke(.blue, lineWidth: 1)
                    .fill(Color.white)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
            )
    }
}

#Preview {
    ButtonView(buttonText: "Hello")
}
