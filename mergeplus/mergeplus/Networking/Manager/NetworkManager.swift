//
//  NetworkManager.swift
//  mergeplus
//
//  Created by Tophun_mh on 2020/06/26.
//  Copyright © 2020 mergepoint. All rights reserved.
//

import Foundation
import SwiftUI

enum NetworkEnvironment: String {
  case production = "https://member.mergepoint.co.kr/newapp"
  case staging = "https://memberdev.mergepoint.co.kr/newapp"
}

struct NetworkManager {

  static let environment: NetworkEnvironment = .staging
  private var router: Router<EndPoint>
  
  enum NetworkResponseError: String, Error {
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We would not decode the response."
  }
  
  fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> NetworkResponseError {
    switch response.statusCode {
    case 401...500: return .authenticationError
    case 501...599: return .badRequest
    case 600: return .outdated
    default: return .failed
    }
  }
}

extension NetworkManager {
  func fetchAppVersion(completion: @escaping (_ version: Version?, _ error: NetworkResponseError?) -> ()) {
    
  }
    
}


