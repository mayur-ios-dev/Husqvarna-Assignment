//
//  TopRatedMovieResponse.swift
//  Husqvarna-Assignment
//
//  Created by Mayur Deshmukh on 2022-10-11.
//

import ObjectMapper

struct TopRatedMovieResponse: ImmutableMappable {
    let page: Int
    let movies: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    init(map: Map) throws {
        page = try map.value("page")
        movies = try map.value("results")
        totalPages = try map.value("total_pages")
        totalResults = try map.value("total_results")
    }
}
