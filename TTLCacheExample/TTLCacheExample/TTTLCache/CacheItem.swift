//
//  AppDelegate.swift
//  TTLCacheExample
//
//  Created by 123 周 on 2023/4/21.
//

import Foundation
class CacheItem<T> {
    let value: T
    let expirationDate: Date
    
    init(value: T, expirationDate: Date) {
        self.value = value
        self.expirationDate = expirationDate
    }
    
    func isExpired() -> Bool {
        return Date() > expirationDate
    }
}
