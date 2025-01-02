//
//  BookWrapper.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 02/01/25.
//

struct BookWrapper: Wrapper {
    typealias T = DBBook
    typealias V = Book
    
    private let captionWrapper: CaptionWrapper
    
    init(captionWrapper: CaptionWrapper = CaptionWrapper()) {
        self.captionWrapper = captionWrapper
    }
    
    func map(_ object: DBBook) -> Book {
        return Book(
            id: object.id,
            name: object.name,
            captions: object.captions.compactMap(captionWrapper.map(_:)))
    }

}
