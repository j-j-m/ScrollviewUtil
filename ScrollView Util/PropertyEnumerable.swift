//
//  PropertyEnumerable.swift
//  ScrollView Util
//
//  Created by Jacob Martin on 2/26/17.
//  Copyright © 2017 Jacob Martin. All rights reserved.
//

import Foundation


//FIXME: - Doesnt work with swift mirroring at current... I dont fully understand. would be nice to enumerate struct properties

public protocol PropertyEnumerable
{
    func allProperties() throws -> [String: Any]
}


extension PropertyEnumerable
{
   public func allProperties() throws -> [String: Any] {
        
        var result: [String: Any] = [:]
        
        let mirror = Mirror(reflecting: self)
        
        // well they are certainly doing a lot wit these cases
        guard let style = mirror.displayStyle, style == .`struct` || style == .`class` else {
            //throw some error
            throw NSError(domain: "jjm.core", code: 999, userInfo: nil)
        }
   print(mirror.children)
        for (label, value) in mirror.children {
            print("\(label): \(value)")
            guard let label = label else {
                continue
            }
            
            result[label] = value
        }
        
        return result
    }
}
