//
//  Caption.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 13/12/24.
//

import Foundation

public struct Caption {
    public let id: UUID
    public let name: String
    public let verses: [Verse]
}

extension Caption {
    
    public func contains(_ text: String) -> Bool {
        let _text = text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        return id.uuidString.contains(_text) ||
        name.lowercased().contains(_text) ||
        verses.contains(where: { $0.contains(_text) })
    }
    
}
