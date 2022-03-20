//
//  Request+Render.swift
//  
//
//  Created by Travis Brigman on 3/19/22.
//

import Vapor
extension Request {
    func render<Context: Encodable>(_ template: String, _ context: Context) async throws -> View {
        let webpageURL = self.url.path
        let now = Date()
        
        let pageInfo = PageInfo(
            pageData: context,
            webpageURL: webpageURL,
            now: now
        )
        return try await self.view.render(template, pageInfo)
        
    }
}
