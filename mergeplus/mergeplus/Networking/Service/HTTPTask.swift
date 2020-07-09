//
//  HTTPTask.swift
//  mergeplus
//
//  Created by Tophun_mh on 2020/06/26.
//  Copyright © 2020 mergepoint. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String: String]

public enum HTTPTask {
  
  case request
  case requestParameters(bodyParameters: Parameters?,
    urlParameters: Parameters?)
  
  case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, additionalHeaders: HTTPHeaders?)
}
