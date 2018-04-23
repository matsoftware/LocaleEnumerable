//
//  LocalizedText.swift
//  LocaleEnumerable
//
//  Created by Mattia Campolese on 23/04/2018.
//  Copyright © 2018 Mattia Campolese. All rights reserved.
//

import Foundation

/// Opaque type that abstracts the localization's mechanism of the injected localeKey.
struct LocalizedText {
    
    private let localeKey: LocaleKey
    private let languageTable: LanguageTableProvideable
    
    init(_ localeKey: LocaleKey, languageTable: LanguageTableProvideable = LanguageTableProvider.shared) {
        self.localeKey = localeKey
        self.languageTable = languageTable
    }
    
    var text: String {
        return NSLocalizedString(localeKey.rawValue, tableName: languageTable.currentSupportedLanguageTable, comment: "")
    }
    
}
