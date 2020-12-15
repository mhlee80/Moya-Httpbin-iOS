//
//  HttpbinService.swift
//  Moya-Httpbin
//
//  Created by mhlee on 2020/12/15.
//

import Foundation
import Moya

enum HttpbinService {
  case showIp
}

extension HttpbinService: Moya.TargetType {
  var baseURL: URL { return URL(string: "https://httpbin.org")! }
  
  var path: String {
    switch self {
    case .showIp:
      return "/ip"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .showIp:
      return .get
    }
  }
  
  var task: Moya.Task {
    switch self {
    case .showIp:
      return .requestPlain
    }
  }
  
  var sampleData: Data {
    switch self {
    case .showIp:
      return "{ \"origin\": \"110.11.238.144\" }".utf8Encoded
    }
  }
  
  var headers: [String: String]? {
    return ["Content-type": "application/json"]
  }
}

// MARK: - Helpers
private extension String {
  var urlEscaped: String {
    return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
  }
  
  var utf8Encoded: Data {
    return data(using: .utf8)!
  }
}
