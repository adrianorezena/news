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
        let lista: [News]
    }
    
    enum Error: Swift.Error {
        case invalidData
    }
    
    static func map(_ data: Data) throws -> [News] {
        let decoder: JSONDecoder = JSONDecoder()
        
        do {
            let root: Root = try decoder.decode(Root.self, from: data)
            return root.lista
        } catch {
            debugPrint("Parse error: \((error as NSError).description)")
            throw Error.invalidData
        }
    }
    
}
