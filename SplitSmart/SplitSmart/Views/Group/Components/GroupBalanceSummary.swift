//
//  GroupBalanceSummary.swift
//  SplitSmart
//
//  Created by Maksym Pikhteryev on 2024-06-22.
//

import SwiftUI
import SwiftData

struct GroupBalanceSummary: View {
    var group: Group
    
    var body: some View {
        Text("You are owed $123 overall")
    }
}

#Preview {
    let config = ModelConfiguration()
    let container = try! ModelContainer(for: Group.self, configurations: config)
    let group = Group(name: "Group #1")
    
    return GroupBalanceSummary(group: group).modelContainer(container)
}
