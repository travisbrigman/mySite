//
//  PageInfo.swift
//  
//
//  Created by Travis Brigman on 3/19/22.
//

import Vapor

struct PageInfo<T>: Encodable where T: Encodable {
    let pageData: T
    let webpageURL: String
    let now: Date
}
