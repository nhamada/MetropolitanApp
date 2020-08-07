//
//  NetworkService.swift
//  MET Base
//
//  Created by Naohiro Hamada on 2020/08/03.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

internal protocol NetworkService {
    associatedtype Req: Request
    associatedtype Res: Response
    
    typealias CompletionHandler = (Result<Res, NetworkServiceError>) -> Void
    
    var session: URLSession { get }
    var sessionConfiguration: URLSessionConfiguration { get }
    
    func fetch(request: Req, completion: @escaping CompletionHandler)
}

internal enum NetworkServiceError: Error {
    case invalidResponse
    case httpConnectionError(statusCode: Int)
    case noData
    case decodingFailure
}

internal class METNetworkService<In: Request, Out: Response>: NetworkService where Out.ResponseDecoder.Input == Data {
    public typealias Req = In
    public typealias Res = Out
    
    internal typealias CompletionHandler = (Result<Out, NetworkServiceError>) -> Void
    
    internal let session: URLSession
    internal let sessionConfiguration: URLSessionConfiguration
    
    internal init(configuration: URLSessionConfiguration) {
        self.sessionConfiguration = configuration
        self.session = URLSession(configuration: self.sessionConfiguration)
    }
    
    internal func fetch(request: In, completion: @escaping CompletionHandler) {
        let dataTask = self.session.dataTask(with: request.make(),
                                             completionHandler: { (data, response, error) in
                                                guard let httpResponse = response as? HTTPURLResponse else {
                                                    completion(.failure(.invalidResponse))
                                                    return
                                                }
                                                switch httpResponse.statusCode {
                                                case 200..<400: break
                                                default:
                                                    completion(.failure(.httpConnectionError(statusCode: httpResponse.statusCode)))
                                                    return
                                                }
                                                guard let data = data, !data.isEmpty else {
                                                    completion(.failure(.noData))
                                                    return
                                                }
                                                let decoder = Res.decoder
                                                do {
                                                    let result = try decoder.decode(Out.self, from: data)
                                                    completion(.success(result))
                                                } catch {
                                                    completion(.failure(.decodingFailure))
                                                }
        })
        dataTask.resume()
    }
}
