//
//  APIRequest.swift
//  CovidRx
//
//  Created by Chris Ferdian on 10/06/20.
//  Copyright © 2020 Chrizers. All rights reserved.
//

import Foundation
import RxSwift

public enum RequestType: String {
    case GET, POST
}

protocol BaseAPIRequest {
    var method: RequestType { get }
    var path: String { get }
    var parameters: [String : String] { get }
}

extension BaseAPIRequest {
    func request(with baseURL: URL) -> URLRequest {
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components")
        }

        components.queryItems = parameters.map {
            URLQueryItem(name: String($0), value: String($1))
        }

        guard let url = components.url else {
            fatalError("Could not get url")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
enum APIRequest {
    case summary
}
extension APIRequest: BaseAPIRequest {
    var method: RequestType {
        switch self {
        case .summary:
            return .GET
        }
    }
    var path: String {
        switch self {
        case .summary:
            return "summary"
        }
    }
    var parameters: [String : String] {
        switch self {
        case .summary:
            return [:]
        }
    }
}
//class APIRequest: BaseAPIRequest {
//
//    var method = RequestType.GET
//    var path = "search"
//    var parameters = [String: String]()
//
//    init(name: String) {
//        parameters["name"] = name
//    }
//}

class APIClient {
    private let baseURL = URL(string: "https://api.covid19api.com/")!

    func send<T: Codable>(apiRequest: BaseAPIRequest) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = apiRequest.request(with: self.baseURL)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    let model: T = try JSONDecoder().decode(T.self, from: data ?? Data())
                    observer.onNext(model)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}
