//
//  TestamentWrapper.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 02/01/25.
//

struct TestamentWrapper: Wrapper {
    typealias T = DBTestament
    typealias V = Testament
    
    private let bookWrapper: BookWrapper
    
    init(bookWrapper: BookWrapper = BookWrapper()) {
        self.bookWrapper = bookWrapper
    }
    
    func map(_ object: DBTestament) -> Testament {
        return Testament(
            id: object.id,
            name: object.name,
            books: object.books.compactMap(bookWrapper.map(_:)))
    }
}
