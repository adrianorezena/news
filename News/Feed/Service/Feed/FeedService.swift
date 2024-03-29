//
//  FeedService.swift
//  Feed
//
//  Created by Adriano Rezena on 17/01/23.
//

import Foundation

public struct FeedService {

    public enum FeedAPI {
        case lastNews
        case lastNewsByType(Int)
//        case lastNewsByPage(Int)
//        case lastNewsByTypeAndPage(type: Int, page: Int)
        
        var path: String {
            switch self {
            case .lastNews:
                return baseURL + "/noticias?chave=" + BASE_KEY
                
            case let .lastNewsByType(type):
                return "\(baseURL)/noticias?chave=\(BASE_KEY)&editoria=\(type)"

//            case let .lastNewsByPage(page):
//                return "\(baseURL)/noticias?chave=\(BASE_KEY)&pagina=\(page)"
//
//            case let .lastNewsByTypeAndPage(type, page):
//                return "\(baseURL)/noticias?chave=\(BASE_KEY)&pagina=\(page)&editoria=\(type)"
            }
        }
        
        var BASE_KEY: String {
            "c2d8b8a4631b413001e9d927568eb310d476596d"
        }
        
        var baseURL: String {
            "https://oesteemfoco.com.br/api"
        }
        
    }
    
    private let client: HTTPClient
    
    public init(client: HTTPClient) {
        self.client = client
    }
    
    public func getLastNews() async throws -> Result<[News], Error> {
        guard let url: URL = URL(string: FeedAPI.lastNews.path) else {
            return .failure(NSError(domain: "any", code: 0))
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            client.execute(url: url) { result in
                let response: Result<[News], Error> = mapResponse(result: result)
                
                switch response {
                case let .success(newsArray):
                    continuation.resume(returning: .success(newsArray))
                
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    public func getLastNewsByType(_ type: Int) async throws -> Result<[News], Error> {
        guard let url: URL = URL(string: FeedAPI.lastNewsByType(type).path) else {
            return .failure(NSError(domain: "any", code: 0))
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            client.execute(url: url) { result in
                let response: Result<[News], Error> = mapResponse(result: result)
                
                switch response {
                case let .success(newsArray):
                    continuation.resume(returning: .success(newsArray))
                    
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    private func mapResponse(result: HTTPClient.HTTPClientResult) -> Result<[News], Error> {
        switch result {
        case let .success((data, _)):
            do {
                let news = try NewsMapper.map(data)
                return .success(news)
            } catch {
                return .failure(error)
            }
            
        case let .failure(error):
            return .failure(error)
        }
    }
    
}
