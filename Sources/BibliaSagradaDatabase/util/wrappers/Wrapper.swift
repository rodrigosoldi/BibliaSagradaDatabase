//
//  Wrapper.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 02/01/25.
//

protocol Wrapper<T, V>: Sendable {
    associatedtype T
    associatedtype V
    
    func map(_ object: T) -> V
}
