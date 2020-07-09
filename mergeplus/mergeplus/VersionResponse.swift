//
//  VersionResponse.swift
//  mergeplus
//
//  Created by Tophun_mh on 2020/06/19.
//  Copyright © 2020 mergepoint. All rights reserved.
//

import Foundation
import Combine

struct Version: Codable {
  var version: String
  var reqiure: Bool
}

class VersionViewModel: ObservableObject {
  @Published var version: Version?
  var cancellationToken: AnyCancellable?
  
  init() {
    getVersion()
  }
}

extension VersionViewModel {
  func getVersion() {
    
    cancellationToken = Server.request(.version)
      .sink(receiveCompletion: { _version in
        
      }, receiveValue: {
        self.version = $0
        print($0.version)
        print($0.reqiure)
      })
  }
}

struct APIClient {
  struct Response<T> {
    let value: T
    let response: URLResponse
  }
  
  func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
    return URLSession.shared
      .dataTaskPublisher(for: request)
      .tryMap { (data, response) -> Response<T> in
        let value = try JSONDecoder().decode(T.self, from: data)
        return Response(value: value, response: response)
    }
    .receive(on: DispatchQueue.main)
    .eraseToAnyPublisher()
  }
}

enum Server {
  enum Enviornment: String {
    case stage = "https://memberdev.mergepoint.co.kr"
    case production = "https://member.mergepoint.co.kr"
  }
  
  static let apiClient = APIClient()
  static let baseURL = URL(string: Enviornment.stage.rawValue)!
}

enum APIPath: String {
  case version = "newapp/version"
}

extension Server {
  static func request(_ path: APIPath) -> AnyPublisher<Version, Error> {
    guard var compoenets = URLComponents(url: baseURL.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true) else { fatalError() }
    compoenets.queryItems = [URLQueryItem(name: "OS", value: "iOS")]
    
    let request = URLRequest(url: compoenets.url!)
    
    return apiClient.run(request)
      .map(\.value)
      .eraseToAnyPublisher()
  }
}
