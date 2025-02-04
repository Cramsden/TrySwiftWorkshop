//
//  Router.swift
//  TrySwiftPrototype2
//
//  Created by Carson Ramsden on 8/17/19.
//  Copyright © 2019 Carson Ramsden. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    case listProviders
    case listLabs
    case listOffices
    case listRiskScores

    static var baseURL: URL!

    var method: HTTPMethod {
        switch self {
        case .listLabs, .listOffices, .listProviders, .listRiskScores:
            return .get
        }
    }

    var path: String {
        switch self {
        case .listProviders:
            return "/providers"
        case .listLabs:
            return "/labs"
        case .listOffices:
            return "/offices"
        case .listRiskScores:
            return "/riskScores"
        }
    }

    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: Router.baseURL.appendingPathComponent(path))
          urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}

