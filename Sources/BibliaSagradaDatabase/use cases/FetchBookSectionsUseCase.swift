//
//  FetchBookSectionsUseCase.swift
//  BibliaSagradaDatabase
//
//  Created by Rodrigo Soldi on 03/01/25.
//  Copyright (c) 2025 Soldi Inc.. All rights reserved.
//
//  This file was generated by Rodrigo Soldi
//

public protocol FetchBookSectionsUseCase {
    func execute() async throws -> [BookSection]
}

public struct FetchBookSectionsUseCaseImpl: FetchBookSectionsUseCase {

    private typealias K = Constants
    private struct Constants {
        static let pentateuco: [Int] = Array(1...5) // Gênesis a Deuteronômio
        static let historicos: [Int] = Array(6...21) // Josué a Ester
        static let sapienciais: [Int] = Array(22...28) // Jó a Cântico dos Cânticos
        static let profetasMaiores: [Int] = Array(29...33) // Isaías a Daniel
        static let profetasMenores: [Int] = Array(34...46) // Oseias a Malaquias
        static let evangelhos: [Int] = Array(47...50) // Mateus a João
        static let atosDosApostolos: [Int] = [51] // Apenas Atos
        static let cartasPaulinas: [Int] = Array(52...65) // Romanos a Filemom
        static let cartasGerais: [Int] = Array(66...72) // Hebreus a Judas
        static let apocalipse: [Int] = [73] // Apenas Apocalipse
    }
    
    public init() {
        
    }

    public func execute() async throws -> [BookSection] {
        return [
            BookSection(
                title: "Pentateuco",
                type: .pentateuco,
                bookIDs: K.pentateuco),
            BookSection(
                title: "Históricos",
                type: .historicos,
                bookIDs: K.historicos),
            BookSection(
                title: "Sapienciais",
                type: .sapienciais,
                bookIDs: K.sapienciais),
            BookSection(
                title: "Profetas Maiores",
                type: .profetasMaiores,
                bookIDs: K.profetasMaiores),
            BookSection(
                title: "Profetas Menores",
                type: .profetasMenores,
                bookIDs: K.profetasMenores),
            BookSection(
                title: "Evangelhos",
                type: .evangelhos,
                bookIDs: K.evangelhos),
            BookSection(
                title: "Atos",
                type: .atosDosApostolos,
                bookIDs: K.atosDosApostolos),
            BookSection(
                title: "Cartas Paulinas",
                type: .cartasPaulinas,
                bookIDs: K.cartasPaulinas),
            BookSection(
                title: "Cartas Gerais",
                type: .cartasGerais,
                bookIDs: K.cartasGerais),
            BookSection(
                title: "Apocalipse",
                type: .apocalipse,
                bookIDs: K.apocalipse)
        ]
    }

}
