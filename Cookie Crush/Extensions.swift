//
//  Extensions.swift
//  Cookie Crush
//
//  Created by Jose Luis Molina on 27/1/15.
//  Copyright (c) 2015 Jose Luis Molina. All rights reserved.
//

import Foundation

extension Dictionary {
    static func loadJSONFromBundle(filename: String) -> Dictionary<String, AnyObject>? {
        if let path = NSBundle.mainBundle().pathForResource(filename, ofType: "json") {
            
            var error: NSError?
            let data: NSData? = NSData(contentsOfFile: path, options: NSDataReadingOptions(), error: &error)
            if let data = data {
                
                let dictionary: AnyObject? = NSJSONSerialization.JSONObjectWithData(data,
                    options: NSJSONReadingOptions(), error: &error)
                if let dictionary = dictionary as? Dictionary<String, AnyObject> {
                    return dictionary
                } else {
                    println("Level file '\(filename)' is not valid JSON: \(error!)")
                    return nil
                }
            } else {
                println("Could not load level file: \(filename), error: \(error!)")
                return nil
            }
        } else {
            println("Could not find level file: \(filename)")
            return nil
        }
    }
}