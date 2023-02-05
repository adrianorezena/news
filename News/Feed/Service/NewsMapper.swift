//
//  NewsMapper.swift
//  Feed
//
//  Created by Adriano Rezena on 25/01/23.
//

import Foundation

struct NewsMapper {
    private struct Root: Decodable {
        let erro: Int
        let msg: String?
        let lista: [News]?
    }
    
    struct ErrorResponse: Codable {
        let code: Int
        let message: String
    }
    
    enum Error: Swift.Error {
        case invalidData
        case failedResponse(ErrorResponse)
    }
    
    static func map(_ data: Data) throws -> [News] {
        let decoder: JSONDecoder = JSONDecoder()

        guard let root: Root = try? decoder.decode(Root.self, from: data) else {
            throw Error.invalidData
        }
        
        if let msg: String = root.msg {
            throw Error.failedResponse(
                ErrorResponse(code: root.erro, message: msg)
            )
        }
        
        return root.lista ?? []
    }
    
}
