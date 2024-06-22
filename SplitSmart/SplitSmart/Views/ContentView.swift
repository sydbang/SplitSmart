//
//  ContentView.swift
//  SplitSmart
//
//  Created by Sunghee Bang on 2024-06-22.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @State private var isPresented: Bool = false
    @Query(sort: \Group.id, order: .reverse) private var groups: [Group]

    var body: some View {
        NavigationStack {
            VStack {
                GroupListView(groups: groups)
                    .navigationTitle("SplitSmart")
            }
            .sheet(isPresented: $isPresented, content: {
                CreateGroupView()
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
