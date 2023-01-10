//
//  NewsTests.swift
//  NewsTests
//
//  Created by Adriano Rezena on 05/01/23.
//

import XCTest
@testable import Feed

final class URLSessionHTTPClientTests: XCTestCase {
    
    override func tearDown() {
        super.tearDown()
        
        URLProtocolStub.removeStub()
    }
    
    func test_getFromURL_failsOnRequestError() {
        let client: URLSessionHTTPClient = makeClient()
        let url: URL = anyURL()
        
        let anyError: Error = anyNSError()
        URLProtocolStub.stub(data: nil, response: nil, error: anyError)
        
        _ = client.execute(url: url) { result in
            switch result {
            case let .failure(error):
                XCTAssertNotNil(error)
            default:
                XCTFail("Expected failure, got \(result) instead")
            }
        }
    }
    
    func test_cancelGetFromURLTask_cancelsURLRequest() {
        let client: URLSessionHTTPClient = makeClient()
        let url: URL = anyURL()

        URLProtocolStub.stub(data: nil, response: nil, error: nil)

        let exp: XCTestExpectation = expectation(description: "Wait for request")

        let task: HTTPClientTask = client.execute(url: url) { result in
            switch result {
            case let .failure(error):
                XCTAssertEqual((error as NSError).code, URLError.cancelled.rawValue)
            default:
                XCTFail("Expected failure, got \(result) instead")
            }

            exp.fulfill()
        }

        task.cancel()

        wait(for: [exp], timeout: 1.0)
    }
    
    func test_getFromURL_succeedsOnHTTPURLResponseWithData() {
        let client: URLSessionHTTPClient = makeClient()
        let url: URL = anyURL()
        let data: Data = anyData()
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
    
    func test_getFromURL_succeedsWithEmptyDataOnHTTPURLResponseWithNilData() {
        let client: URLSessionHTTPClient = makeClient()
        let url: URL = anyURL()
        let emptyData: Data = Data()
        let successResponse: HTTPURLResponse = HTTPURLResponse(url: anyURL(), statusCode: 204, httpVersion: nil, headerFields: nil)!
        
        URLProtocolStub.stub(data: nil, response: successResponse, error: nil)
        
        let exp: XCTestExpectation = expectation(description: "Wait for request")
        
        _ = client.execute(url: url) { result in
            switch result {
            case let .success(response):
                XCTAssertEqual(response.0, emptyData)
                XCTAssertEqual(response.1.statusCode, successResponse.statusCode)
                XCTAssertEqual(response.1.url, successResponse.url)
                
            default:
                XCTFail("Expected success, got \(result) instead")
            }
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
    }

    // MARK: - Helpers
    private func makeClient() -> URLSessionHTTPClient {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolStub.self]
        let session = URLSession(configuration: configuration)
        let client: URLSessionHTTPClient = URLSessionHTTPClient(session: session)
        return client
    }
    
}
