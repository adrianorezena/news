//
//  FeedServiceTests.swift
//  FeedTests
//
//  Created by Adriano Rezena on 17/01/23.
//

import XCTest
@testable import Feed

final class FeedServiceTests: XCTestCase {
    
    let serviceSuccessfulResponse: String = "\"{\\\"erro\\\":0,\\\"lista\\\":[{\\\"id\\\":\\\"48630\\\",\\\"titulo\\\":\\\"PDT determina suspens\\\\u00e3o partid\\\\u00e1ria do vereador Vanirto Conrad\\\",\\\"data\\\":\\\"2023-01-21 01:16:21\\\",\\\"foto\\\":\\\"https:\\\\/\\\\/www.oesteemfoco.com.br\\\\/images\\\\/noticias\\\\/48630\\\\/677c1aa43a8dae352b81479b13f675d1.jpeg\\\",\\\"id_categoria\\\":\\\"54\\\",\\\"categoria\\\":\\\"Oeste Catarinense\\\",\\\"autor\\\":\\\"J\\\\u00fanior Recalcati\\\",\\\"url\\\":\\\"https:\\\\/\\\\/www.oesteemfoco.com.br\\\\/noticia\\\\/48630\\\\/pdt-determina-suspensao-partidaria-do-vereador-vanirto-conrad\\\",\\\"subtitulo\\\":\\\"Ex-presidente da C\\\\u00e2mara de Vereadores de S\\\\u00e3o Miguel do Oeste responder\\\\u00e1 a processo \\\\u00e9tico-disciplinar instaurado pela Comiss\\\\u00e3o de \\\\u00c9tica do partido\\\",\\\"municipio_id\\\":\\\"1\\\",\\\"municipio_nome\\\":\\\"S\\\\u00e3o Miguel do Oeste - SC\\\"}\")"
    
    func test_getLastNews_pathIsCorrect() {
        XCTAssertEqual(FeedService.FeedAPI.lastNews.path, "https://oesteemfoco.com.br/api/noticias?chave=c2d8b8a4631b413001e9d927568eb310d476596d")
    }
    
    func test_getLastNews_successfullyReturnsLastNews() async throws {
        let client: URLSessionHTTPClient = makeClient()
        let url: URL = anyURL()
        let data: Data = Data(serviceSuccessfulResponse.utf8)
        
        let successResponse: HTTPURLResponse = HTTPURLResponse(url: anyURL(), statusCode: 200, httpVersion: nil, headerFields: nil)!
        
        URLProtocolStub.stub(data: data, response: successResponse, error: nil)
        
        let exp: XCTestExpectation = expectation(description: "Wait for request")
        
        _ = client.execute(url: url) { result in
            switch result {
            case let .success(response):
                XCTAssertEqual(response.0, data)
                XCTAssertEqual(response.1.statusCode, successResponse.statusCode)
                XCTAssertEqual(response.1.url, successResponse.url)
                
            default:
                XCTFail("Expected success, got \(result) instead")
            }
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
    }

    private func makeClient() -> URLSessionHTTPClient {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolStub.self]
        let session = URLSession(configuration: configuration)
        let client: URLSessionHTTPClient = URLSessionHTTPClient(session: session)
        return client
    }
    
}
