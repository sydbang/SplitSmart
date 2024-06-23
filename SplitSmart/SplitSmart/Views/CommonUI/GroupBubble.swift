//
//  GroupBubble.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import SwiftUI

struct GroupBubble: View {
    var name: String
    var isGroup: Bool = true
    var body: some View {
        HStack {
            if isGroup {
                Image(systemName: "list.dash")
            } else {
                Image(systemName: "person")
            }
            Text(name)
        }
        .padding(.horizontal, 10)
        .padding(2)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray, lineWidth: 1)
                .fill(Color.white)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
        )
    }
}

#Preview {
    GroupBubble(name: "Max P.")
}
