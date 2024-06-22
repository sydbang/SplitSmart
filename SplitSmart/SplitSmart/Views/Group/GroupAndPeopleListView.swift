//
//  GroupAndPeopleList.swift
//  SplitSmart
//
//  Created by Maksym Pikhteryev on 2024-06-22.
//

import SwiftUI

struct GroupAndPeopleListView: View {
    var body: some View {
        NavigationStack {
            VStack {
                GroupListView()
                PeopleListView()
            }
        }
    }
}

#Preview {
    GroupAndPeopleListView()
}
