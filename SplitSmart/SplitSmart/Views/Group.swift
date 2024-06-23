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
    var simplifyDebts: Bool
    
    @Relationship(inverse: \Person.groups) var people = [Person]()
    
    init(id: String = UUID().uuidString, name: String, simplifyDebts: Bool = true) {
        self.id = id
        self.name = name
        self.simplifyDebts = simplifyDebts
    }
    

}
