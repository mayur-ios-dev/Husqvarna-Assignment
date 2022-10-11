//
//  MovieRouter.swift
//  Husqvarna-Assignment
//
//  Created by Mayur Deshmukh on 2022-10-11.
//

import Alamofire

enum MovieRouter {
    case topRated
}

extension MovieRouter: UrlRequestBuildable {
    var baseUrlPath: String { "https://api.themoviedb.org/3/movie/" }
    
    var path: String {
        switch self {
        case .topRated: return "top_rated"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .topRated: return .get
        }
    }

    var queryParameters: [String : String] {
        return ["api_key" : "297ddb93a4bb377a5f6fa91a298077de"]
    }
}

extension MovieRouter: URLRequestConvertible {}
