
import Foundation

public struct URLRequestBuilder {
    public init(){}
    public func createRequestWith(baseURL: String,
                              params: [String: String]? = nil,
                              headers: [String: String]? = nil) -> URLRequest? {
        RequestBuilder()
            .addEndPoint(baseURL)
            .addComponents()
            .addParam(params)
            .addHeader(headers)
            .build()
    }
}
