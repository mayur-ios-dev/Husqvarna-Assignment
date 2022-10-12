//
//  Movie.swift
//  Husqvarna-Assignment
//
//  Created by Mayur Deshmukh on 2022-10-11.
//

import ObjectMapper

struct Movie {
    let backdropPath: String
    let id: Int
    let originalTitle: String
    let overview: String
    let posterPath: String
    let releaseDate: Date
    let title: String
    let voteAverage: Double
    let voteCount: Int
}

extension Movie: ImmutableMappable {
    init(map: Map) throws {
        backdropPath = try map.value("backdrop_path")
        id = try map.value("id")
        originalTitle = try map.value("original_title")
        overview = try map.value("overview")
        posterPath = try map.value("poster_path")
        releaseDate = try map.value(
            "release_date",
            using: DateFormatterTransform(dateFormatter: .yyyyMMddFormatter)
        )
        title = try map.value("title")
        voteAverage = try map.value("vote_average")
        voteCount = try map.value("vote_count")
    }
}

extension Movie: Identifiable {}

import Foundation

extension Movie {
    var backdropURL: URL? {
        URL(string: .imageBaseURLPath + backdropPath)
    }
    
    var posterURL: URL? {
        URL(string: .imageBaseURLPath + posterPath)
    }
    
    var releaseYear: String {
        releaseDate.yyyyFormatted
    }
}

private extension Date {
    var yyyyFormatted: String {
        DateFormatter.yyyyFormatter.string(from: self)
    }
}

private extension DateFormatter {
    static let yyyyFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter
    }()
    
    static let yyyyMMddFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
}

private extension String {
    static let imageBaseURLPath = "https://image.tmdb.org/t/p/original"
}
