//
//  Bible.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 13/12/24.
//

public struct Bible {
    public let oldTestament: Testament
    public let newTestament: Testament
}

extension Bible {
    
    public func contains(_ text: String) -> Bool {
        let _text = text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        return oldTestament.contains(_text) ||
        newTestament.contains(_text)
    }
    
}
