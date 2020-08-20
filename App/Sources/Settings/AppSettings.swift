//
//  AppSettings.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/08/18.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

enum AppSettings {
    @UserDefaultsStore(key: "app-last-update-date-string", defaultValue: "")
    public static var lastUpdate: String
    
    public static var departmentUpdateInterval: TimeInterval {
        60 * 60 * 24
    }
}
