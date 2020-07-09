//
//  CommonApi.swift
//  mergeplus
//
//  Created by Tophun_mh on 2020/06/26.
//  Copyright © 2020 mergepoint. All rights reserved.
//

import Foundation

public enum CommonApi {
  case version
}

extension CommonApi: EndPointType {
  var baseURL: URL {
    guard let url = URL(string: NetworkManager.environment.rawValue) else { fatalError("baseURL could not be configured") }
    return url
  }
  
  var path: String {
    switch self {
    case .version:
      return "version"
    }
  }
  
  var httpMethod: HTTPMethod {
    return .get
  }
  
  var task: HTTPTask {
    switch self {
    case .version:
      return .requestParameters(bodyParameters: nil, urlParameters: ["os": "iOS"])
    }
  }
  
  var headers: HTTPHeaders? {
    return nil
    //return ["User-Agent": "mirge", "Os": "IOS", "Version": Bundle.main.versionNumber]
  }
}
