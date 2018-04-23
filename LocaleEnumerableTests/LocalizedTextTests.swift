//
//  LocalizedTextTests.swift
//  LocaleEnumerableTests
//
//  Created by Mattia Campolese on 23/04/2018.
//  Copyright © 2018 Mattia Campolese. All rights reserved.
//

import XCTest
@testable import LocaleEnumerable

class LocaleKeyTests: XCTestCase {
    
    func test_allKeys_multipleLocales_shouldBeTranslated() {
        
        [
            // Supported languages
            MockLanguageTableProvider(language: "IT"),
            MockLanguageTableProvider(language: "EN"),
            ].forEach {
                assertLocalizedText(languageTable: $0)
        }
        
    }
    
    private func assertLocalizedText(languageTable: LanguageTableProvideable, line: UInt = #line) {
        LocaleKey.allCases.forEach {
            XCTAssertNotEqual(LocalizedText($0, languageTable: languageTable).text, $0.rawValue, line: line)
        }
        
    }
    
}

private class MockLanguageTableProvider: LanguageTableProvideable {
    
    var currentSupportedLanguageTable: String
    
    init(language: String) {
        self.currentSupportedLanguageTable = "Localizable-\(language)"
    }
    
}
