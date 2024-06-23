//
//  RadioButton.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import SwiftUI

struct RadioButton: View {
    var name: String
    @Binding var selected: Bool
    var body: some View {
        HStack {
            Text(name)
            Spacer()
            selected ? Image(systemName: "circlebadge.fill") : Image(systemName: "circlebadge")
        }
        .padding()
    }
}

#Preview {
    RadioButton(name: "Max P.", selected: Binding.constant(false))
}
