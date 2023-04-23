//
//  File.swift
//  
//
//  Created by Linkon Sid on 23/4/23.
//

import Foundation

final class RequestBuilder {
    private var components: URLComponents?
    private var baseURL: String?
    private var headers: [String: String]?
    public private(set) var request: URLRequest?
}

// MARK: - Builder Components
extension RequestBuilder {
    public func addEndPoint(_ url: String) -> Self {
        self.baseURL = url
        return self
    }

    public func addComponents() -> Self {
        guard let base = baseURL, let urlComponent = URLComponents(string: base) else {
            return self
        }
        self.components = urlComponent
        return self
    }

    public func addParam(_ params: [String: String]?) -> Self {
        components?.addParams(params: params)
        return self
    }

    public func addHeader(_ headers: [String: String]?) -> Self {
        self.headers = headers
        return self
    }

    public func build() -> URLRequest? {
        guard let url = components?.url else {return nil}
        self.request = URLRequest(url: url)
        return request?.addHeaders(headers: self.headers)
    }
}
