//
//  NewsTests+Extensions.swift
//  NewsTests
//
//  Created by Adriano Rezena on 05/01/23.
//

import Foundation

func anyURL() -> URL {
    URL(string: "http://url.com")!
}

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 0)
}

func anyData() -> Data {
    Data("any data".utf8)
}
