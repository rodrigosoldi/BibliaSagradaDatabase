//
//  BibleWrapper.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 02/01/25.
//

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
