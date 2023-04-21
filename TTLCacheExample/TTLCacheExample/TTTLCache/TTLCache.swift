//
//  AppDelegate.swift
//  TTLCacheExample
//
//  Created by 123 周 on 2023/4/21.
//

import Foundation

class TTLCache<Key: Hashable, Value> {
    private let cache = NSCache<WrappedKey, CacheItem<Value>>()
    
    func setValue(_ value: Value, forKey key: Key, ttl: TimeInterval) {
        let expirationDate = Date().addingTimeInterval(ttl)
        let item = CacheItem(value: value, expirationDate: expirationDate)
        cache.setObject(item, forKey: WrappedKey(key))
    }
    
    func getValue(forKey key: Key) -> Value? {
        guard let item = cache.object(forKey: WrappedKey(key)) else {
            return nil
        }
        
        if item.isExpired() {
            cache.removeObject(forKey: WrappedKey(key))
            return nil
        }
        
        return item.value
    }
    
    func removeValue(forKey key: Key) {
        cache.removeObject(forKey: WrappedKey(key))
    }
    
    func removeAllValues() {
        cache.removeAllObjects()
    }
    
    private class WrappedKey: NSObject {
        let key: Key
        
        init(_ key: Key) {
            self.key = key
        }
        
        override var hash: Int {
            return key.hashValue
        }
        
        override func isEqual(_ object: Any?) -> Bool {
            guard let other = object as? WrappedKey else {
                return false
            }
            return self.key == other.key
        }
    }
}
