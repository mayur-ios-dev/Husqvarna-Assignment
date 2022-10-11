//
//  Movie.swift
//  Husqvarna-Assignment
//
//  Created by Mayur Deshmukh on 2022-10-11.
//

import ObjectMapper

struct Movie: ImmutableMappable {
    let backdropPath: String
    let id: Int
    let originalTitle: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let title: String
    let voteAverage: Double
    let voteCount: Int
    
    init(map: Map) throws {
        backdropPath = try map.value("backdrop_path")
        id = try map.value("id")
        originalTitle = try map.value("original_title")
        overview = try map.value("overview")
        posterPath = try map.value("poster_path")
        releaseDate = try map.value("release_date")
        title = try map.value("title")
        voteAverage = try map.value("vote_average")
        voteCount = try map.value("vote_count")
    }
}
