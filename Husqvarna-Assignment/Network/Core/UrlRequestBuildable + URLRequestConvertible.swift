//
//  UrlRequestBuildable + URLRequestConvertible.swift
//  Husqvarna-Assignment
//
//  Created by Mayur Deshmukh on 2022-10-10.
//

import Alamofire
import Foundation

extension URLRequestConvertible where Self: UrlRequestBuildable {
    func asURLRequest() throws -> URLRequest { try request }
}
