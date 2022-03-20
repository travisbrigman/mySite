//
//  ProjectsLoopsContext.swift
//  
//
//  Created by Travis Brigman on 3/19/22.
//

import Foundation
struct ProjectsLoopsContext: Encodable {
    let title: String
    let sectionTitle: String
    let description: String
    let cards: [Card]
}
