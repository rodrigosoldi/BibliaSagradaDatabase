//
//  Wrapper.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 13/12/24.
//

protocol Wrapper {
    func map(_ dbBible: DBBible) -> Bible
}

struct WrapperImpl: Wrapper {
    
    func map(_ dbBible: DBBible) -> Bible {
        return Bible(
            oldTestament: mapTestament(dbBible.oldTestament),
            newTestament: mapTestament(dbBible.newTestament))
    }
    
    private func mapTestament(_ dbTestament: DBTestament) -> Testament {
        return Testament(
            id: dbTestament.id,
            name: dbTestament.name,
            books: dbTestament.books.compactMap(mapBook(_:)))
    }
    
    private func mapBook(_ dbBook: DBBook) -> Book {
        return Book(
            id: dbBook.id,
            name: dbBook.name,
            captions: dbBook.captions.compactMap(mapCaption(_:)))
    }
    
    private func mapCaption(_ dbCaption: DBCaption) -> Caption {
        return Caption(
            id: dbCaption.id,
            name: dbCaption.name,
            verses: dbCaption.verses.compactMap(mapVerse(_:)))
    }
    
    private func mapVerse(_ dbVerse: DBVerse) -> Verse {
        return Verse(
            id: dbVerse.id,
            name: dbVerse.name,
            text: dbVerse.text)
    }
    
}
