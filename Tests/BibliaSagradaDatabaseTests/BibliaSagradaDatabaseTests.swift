import Testing
@testable import BibliaSagradaDatabase

@Test func fetchBible() async throws {
    
    Task {
        do  {
            let controller: BibliaSagradaControllable = try BibliaSagradaController()
            let bible = try await controller.fetchBible()
            #expect(bible.newTestament.books.count == 27)
            #expect(bible.oldTestament.books.count == 0)
        } catch {
            #expect(false)
        }
    }
}
