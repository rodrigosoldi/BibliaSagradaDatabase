//
//  Testament.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 13/12/24.
//

import Foundation

public struct Testament {
    public let id: UUID
    public let name: String
    public let books: [Book]
}

extension Testament {
    
    public func contains(_ text: String) -> Bool {
        let _text = text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        return id.uuidString.contains(_text) ||
        name.lowercased().contains(_text) ||
        books.contains(where: { $0.contains(_text) })
    }
    
}
