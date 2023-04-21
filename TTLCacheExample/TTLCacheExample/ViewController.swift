//
//  ViewController.swift
//  TTLCacheExample
//
//  Created by 123 周 on 2023/4/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let cache = TTLCache<String, String>()
        cache.setValue("value1", forKey: "key1", ttl: 10)
        if let value = cache.getValue(forKey: "key1") {
            print("value: \(value)")
        } else {
            print("value has expired or not exists")
        }

        sleep(10)

        if let value = cache.getValue(forKey: "key1") {
            print("value: \(value)")
        } else {
            print("value has expired or not exists")
        }
    }


}

