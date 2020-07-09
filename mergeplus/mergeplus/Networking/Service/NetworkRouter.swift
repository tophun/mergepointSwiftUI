//
//  NetworkRouter.swift
//  mergeplus
//
//  Created by Tophun_mh on 2020/06/26.
//  Copyright © 2020 mergepoint. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ result: Result<Data?, Error>, _ response: URLResponse?) -> ()

protocol NetworkRouter: class {
  
  associatedtype EndPoint: EndPointType

  func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
  func cancel()
}
