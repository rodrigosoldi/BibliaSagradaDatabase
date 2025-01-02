//
//  VerseWrapper.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 02/01/25.
//

struct VerseWrapper: Wrapper {
    typealias T = DBVerse
    typealias V = Verse
 
    func map(_ object: DBVerse) -> Verse {
        return Verse(
            id: object.id,
            name: object.name,
            text: object.text)
    }
}
