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
        fatalError()
    }
    
}
