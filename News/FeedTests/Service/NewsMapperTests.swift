//
//  NewsMapperTests.swift
//  FeedTests
//
//  Created by Adriano Rezena on 25/01/23.
//

import XCTest
@testable import Feed

final class NewsMapperTests: XCTestCase {

    func test_map_throwsOnInvalidData() {
        let data: Data = anyData()
        
        XCTAssertThrowsError(
            try NewsMapper.map(data)
        )
    }

    func test_map_returnsItemsFromData() throws {
        let news1: (model: News, json: [String: Any]) = makeNews(id: "1")
        let news2: (model: News, json: [String: Any]) = makeNews(id: "2")
        
        let newsJson: [String: Any] = ["erro": 0, "lista": [news1.json, news2.json]]
        let data: Data = try JSONSerialization.data(withJSONObject: newsJson)
        let news: [News] = try NewsMapper.map(data)
        
        XCTAssertEqual(news, [news1.model, news2.model])
    }
    
    private func makeNews(id: String) -> (model: News, json: [String: Any]) {
        let news: News = News(
            id: id,
            title: "News \(id)",
            date: "2023-01-25 23:30:15",
            picture: "",
            categoryID: "1",
            categoryName: "Geral",
            authorName: "Author \(id)",
            url: "",
            subtitle: "Some subtitle",
            cityName: "City Name"
        )
        
        let json: [String: Any] = [
            "id": news.id,
            "titulo": news.title,
            "data": news.date,
            "foto": news.picture,
            "id_categoria": news.categoryID,
            "categoria": news.categoryName,
            "autor": news.authorName,
            "url": news.url,
            "subtitulo": news.subtitle,
            "municipio_id": news.cityID,
            "municipio_nome": news.cityName,
        ]
        
        return (news,  json)
    }
    
}
