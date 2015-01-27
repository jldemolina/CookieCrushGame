//
//  Swap.swift
//  Cookie Crush
//
//  Created by Jose Luis Molina on 27/1/15.
//  Copyright (c) 2015 Jose Luis Molina. All rights reserved.
//

import Foundation

func ==(lhs: Swap, rhs: Swap) -> Bool {
    return (lhs.cookieA == rhs.cookieA && lhs.cookieB == rhs.cookieB) ||
        (lhs.cookieB == rhs.cookieA && lhs.cookieA == rhs.cookieB)
}

struct Swap: Printable, Hashable {
    let cookieA: Cookie
    let cookieB: Cookie
    
    var hashValue: Int {
        return cookieA.hashValue ^ cookieB.hashValue
    }
    
    init(cookieA: Cookie, cookieB: Cookie) {
        self.cookieA = cookieA
        self.cookieB = cookieB
    }
    
    var description: String {
        return "swap \(cookieA) with \(cookieB)"
    }
}