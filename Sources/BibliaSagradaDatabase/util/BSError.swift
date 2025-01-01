//
//  BibliaSagradaDatabaseError.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 13/12/24.
//

public enum BSError: Error {
    case unableToFindDatabaseFile
    case objectDetached
    case unableToFetchBible
}
