//
//  MovieAPI.swift
//  Husqvarna-Assignment
//
//  Created by Mayur Deshmukh on 2022-10-10.
//

import Combine
import Alamofire
import Foundation

protocol MovieAPIType {
    func getTopRatedMovies() -> AnyPublisher<TopRatedMovieResponse, Error>
}

struct MovieAPI: MovieAPIType {
    func getTopRatedMovies() -> AnyPublisher<TopRatedMovieResponse, Error> {
        AF.request(MovieRouter.topRated)
            .validate(statusCode: 200..<300)
            .publishString()
            .tryMap { dataResponse in
                guard let jsonString = dataResponse.value else {
                    throw URLError(
                        .badServerResponse,
                        userInfo: [
                            "reason": "JSON String value unexpectedly nil"
                        ]
                    )
                }
                return try TopRatedMovieResponse(JSONString: jsonString)
            }
            .eraseToAnyPublisher()
    }
}
