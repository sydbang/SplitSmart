//
//  Group.swift
//  SplitSmart
//
//  Created by Maksym Pikhteryev on 2024-06-22.
//

import Foundation
import SwiftData

@Model
final class Group: Identifiable {
    
    @Attribute(.unique) var id: String = UUID().uuidString
        var name: String
        init(id: String = UUID().uuidString, name: String) {
            self.id = id
            self.name = name
        }
}
