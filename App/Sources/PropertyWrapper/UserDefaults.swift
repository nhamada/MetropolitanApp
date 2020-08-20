//
//  UserDefaults.swift
//  MET App
//
//  Created by Naohiro Hamada on 2020/08/18.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

protocol UserDefaultsValueStorable {
    static var loadFunc: ((String) -> Self?) { get }
}

@propertyWrapper
struct UserDefaultsStore<Value: UserDefaultsValueStorable> {
    private let key: String
    private let defaultValue: Value
    
    init(key: String, defaultValue: Value) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: Value {
        get {
            Value.load(key) ?? defaultValue
        }
        set {
            newValue.store(key)
        }
    }
}

private extension UserDefaultsValueStorable {
    static func load(_ key: String) -> Self? {
        loadFunc(key)
    }
    func store(_ key: String) {
        UserDefaults.standard.set(self, forKey: key)
    }
}

extension String: UserDefaultsValueStorable {
    static var loadFunc: ((String) -> String?) {
        return UserDefaults.standard.string(forKey:)
    }
}

extension Int: UserDefaultsValueStorable {
    static var loadFunc: ((String) -> Int?) {
        return UserDefaults.standard.integer(forKey:)
    }
}

extension Double: UserDefaultsValueStorable {
    static var loadFunc: ((String) -> Double?) {
        return UserDefaults.standard.double(forKey:)
    }
}

extension Bool: UserDefaultsValueStorable {
    static var loadFunc: ((String) -> Bool?) {
        return UserDefaults.standard.bool(forKey:)
    }
}
