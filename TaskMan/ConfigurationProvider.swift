//
//  ConfigurationProvider.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 24/12/2022.
//

import Foundation

class ConfigurationProvider {
    
    static func getConfiguration() -> NSDictionary {
        let path = Bundle.main.path(forResource: "Settings", ofType: "plist")
        return NSDictionary(contentsOfFile: path!)!
    }
}
