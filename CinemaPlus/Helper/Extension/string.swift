//
//  string.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 1.05.2023.
//

import Foundation

extension String {
    var localizable: String {
        let lang = UserDefaults.standard.string(forKey: "appLang")
        let path = Bundle.main.path(forResource: lang, ofType: "lproj") ?? ""
        let bundle = Bundle(path: path) ?? Bundle()
        
       return NSLocalizedString(self, tableName: "", bundle: bundle, value: "", comment: "")
    }
}
