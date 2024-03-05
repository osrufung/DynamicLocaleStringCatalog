import XCTest
@testable import StringCatalogs

final class LocalizationTests: XCTestCase {

    func test_DelayedTranslations() throws {
        let catalogES = StringCatalog(locale: .init(identifier: "es"))
        let catalogDE = StringCatalog(locale: .init(identifier: "de"))
        
        XCTAssertEqual(Bundle.module.localizations, ["de", "en", "es"])
        XCTAssertEqual(Bundle.module.developmentLocalization, "de")
        XCTAssertEqual(Bundle.module.preferredLocalizations, ["en"])
        
        XCTAssertEqual(Locale.current.language.languageCode?.identifier, "en")
        XCTAssertEqual(Locale.autoupdatingCurrent.language.languageCode?.identifier, "en")
        
        XCTAssertEqual(String(localized: catalogES.hello), "Hola")
        XCTAssertEqual(catalogES.hello.locale.identifier, "es")
        
        XCTAssertEqual(String(localized: catalogDE.hello), "Danke")
        XCTAssertEqual(catalogDE.hello.locale.identifier, "de")
    }
}

