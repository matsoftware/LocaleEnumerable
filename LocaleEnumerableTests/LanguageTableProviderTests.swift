//
//  LanguageTableProviderTests.swift
//  LocaleEnumerableTests
//
//  Created by Mattia Campolese on 23/04/2018.
//  Copyright © 2018 Mattia Campolese. All rights reserved.
//

import Foundation
@testable import LocaleEnumerable
import XCTest

class LanguageTableProviderTests: XCTestCase {
    
    func test_currentSupportedLanguageTable_languageNotSupported_shouldReturnTheDefaultLanguageTable() {
        
        let languageTableProvider = LanguageTableProvider(preferredLanguage: "Klingon")
        
        XCTAssertEqual(languageTableProvider.currentSupportedLanguageTable, "Localizable-EN")
        
    }
    
    func test_currentSupportedLanguageTable_languageSupportedWithNoRegionalsettings_shouldReturnTheAssociatedTable() {
        
        let languageTableProvider = LanguageTableProvider(preferredLanguage: "it")
        
        XCTAssertEqual(languageTableProvider.currentSupportedLanguageTable, "Localizable-IT")
        
    }
    
    func test_currentSupportedLanguageTable_languageSupportedWithRegionalsettings_shouldReturnTheAssociatedTable() {
        
        let languageTableProvider = LanguageTableProvider(preferredLanguage: "it-US")
        
        XCTAssertEqual(languageTableProvider.currentSupportedLanguageTable, "Localizable-IT")
        
    }
    
}
