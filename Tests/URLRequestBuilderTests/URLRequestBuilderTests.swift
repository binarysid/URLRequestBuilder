import XCTest
@testable import URLRequestBuilder

final class URLRequestBuilderTests: XCTestCase {
    private var sut: URLRequestBuilder!
    private let endPoint = "api.github.com"
    private let params = ["q": "binarysid", "per_page": String(10)]
    private let headers = ["Authorization": "token Eqrr12@sdfops3498azcvfe"]
    
    override func setUp() {
        sut = URLRequestBuilder()
    }

    func test_url() {
        do {
            let result = try XCTUnwrap(sut.createRequestWith(baseURL:endPoint))
            XCTAssert(result.url != nil, "URL nil")
        } catch {
            XCTFail("Request build failed")
        }
    }

    func test_url_with_param() {
        do {
            let result = try XCTUnwrap(sut.createRequestWith(baseURL: endPoint, params:params))
            XCTAssert(result.url != nil, "URL nil")
        } catch {
            XCTFail("Request build failed")
        }
    }

    func test_url_with_header() {
        do {
            let result = try XCTUnwrap(sut.createRequestWith(baseURL: endPoint, headers: headers))
            XCTAssert(result.url != nil, "URL nil")
        } catch {
            XCTFail("Request build failed")
        }
    }

    func test_url_with_param_header() {
        do {
            let result = try XCTUnwrap(sut.createRequestWith(baseURL: endPoint, params:params, headers: headers))
            XCTAssert(result.url != nil, "URL nil")
        } catch {
            XCTFail("Request build failed")
        }
    }

    override func tearDown() {
        sut = nil
    }
}
