//
//  LanguageTableProvider.swift
//  LocaleEnumerable
//
//  Created by Mattia Campolese on 23/04/2018.
//  Copyright © 2018 Mattia Campolese. All rights reserved.
//

import Foundation

protocol LanguageTableProvideable {
    
    var currentSupportedLanguageTable: String { get }
    
}

final class LanguageTableProvider: LanguageTableProvideable {
    
    static let shared: LanguageTableProvider = LanguageTableProvider()
    
    private let preferredLanguage: String
    
    init(preferredLanguage: String = Locale.preferredLanguages.first ?? "") {
        self.preferredLanguage = preferredLanguage
    }
    
    lazy var currentSupportedLanguageTable: String = {
        let preferredLanguageWithoutRegion =
            preferredLanguage.split(separator: "-").first ?? ""
        let languageTableFile = "Localizable-\(String(preferredLanguageWithoutRegion).uppercased())"
        if Bundle.main.path(forResource: languageTableFile, ofType: "strings") != nil {
            return languageTableFile
        } else {
            return "Localizable-EN"
        }
    }()
    
}
