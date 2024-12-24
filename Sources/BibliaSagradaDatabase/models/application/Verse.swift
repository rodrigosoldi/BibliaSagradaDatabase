//
//  Verse.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 13/12/24.
//

import Foundation

public struct Verse {
    public let id: UUID
    public let name: String
    public let text: String
    
    public init(id: UUID, name: String, text: String) {
        self.id = id
        self.name = name
        self.text = text
    }
}

extension Verse: Identifiable {
    
}

extension Verse: Hashable, Equatable {
    
    public static func ==(lhs: Verse, rhs: Verse) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

extension Verse {
    
    public func contains(_ text: String) -> Bool {
        let _text = text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        return id.uuidString.contains(_text) ||
        name.lowercased().contains(_text) ||
        self.text.lowercased().contains(_text)
    }
    
}
