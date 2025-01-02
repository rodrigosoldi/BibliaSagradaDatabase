//
//  Wrapper.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 13/12/24.
//

protocol Wrapper<T, V>: Sendable {
    associatedtype T
    associatedtype V
    
    func map(_ object: T) -> V
}

struct BibleWrapper: Wrapper {
    typealias T = [DBTestament]
    typealias V = Bible
    
    private let testamentWrapper: TestamentWrapper
    
    init(testamentWrapper: TestamentWrapper = TestamentWrapper()) {
        self.testamentWrapper = testamentWrapper
    }
    
    func map(_ object: [DBTestament]) -> Bible {        
        return Bible(
            oldTestament: testamentWrapper.map(object[0]),
            newTestament: testamentWrapper.map(object[1]))
    }
}

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
