//
//  CaptionWrapper.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 02/01/25.
//

struct CaptionWrapper: Wrapper {
    typealias T = DBCaption
    typealias V = Caption
    
    private let verseWrapper: VerseWrapper
    
    init(verseWrapper: VerseWrapper = VerseWrapper()) {
        self.verseWrapper = verseWrapper
    }
    
    func map(_ object: DBCaption) -> Caption {
        return Caption(
            id: object.id,
            name: object.name,
            verses: object.verses.compactMap(verseWrapper.map(_:)))
    }
}
