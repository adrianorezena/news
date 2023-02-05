//
//  News.swift
//  Feed
//
//  Created by Adriano Rezena on 25/01/23.
//

import Foundation

public struct News: Decodable, Hashable, Identifiable {
    public let id: String
    public let title: String
    public let date: String
    public let picture: String
    public let categoryID: String
    public let categoryName: String
    public let authorName: String
    public let url: String
    public let subtitle: String
    public let cityID: String?
    public let cityName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title = "titulo"
        case date = "data"
        case picture = "foto"
        case categoryID = "id_categoria"
        case categoryName = "categoria"
        case authorName = "autor"
        case url = "url"
        case subtitle = "subtitulo"
        case cityID = "municipio_id"
        case cityName = "municipio_nome"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.date = try container.decode(String.self, forKey: .date)
        self.picture = try container.decode(String.self, forKey: .picture)
        self.categoryID = try container.decode(String.self, forKey: .categoryID)
        self.categoryName = try container.decode(String.self, forKey: .categoryName)
        self.authorName = try container.decode(String.self, forKey: .authorName)
        self.url = try container.decode(String.self, forKey: .url)
        self.subtitle = try container.decode(String.self, forKey: .subtitle)
        self.cityID = try container.decodeIfPresent(String.self, forKey: .cityID)
        self.cityName = try container.decode(String.self, forKey: .cityName)
    }
    
    init(
        id: String,
        title: String,
        date: String,
        picture: String,
        categoryID: String,
        categoryName: String,
        authorName: String,
        url: String,
        subtitle: String,
        cityID: String? = nil,
        cityName: String
    ) {
        self.id = id
        self.title = title
        self.date = date
        self.picture = picture
        self.categoryID = categoryID
        self.categoryName = categoryName
        self.authorName = authorName
        self.url = url
        self.subtitle = subtitle
        self.cityID = cityID
        self.cityName = cityName
    }
    
}
