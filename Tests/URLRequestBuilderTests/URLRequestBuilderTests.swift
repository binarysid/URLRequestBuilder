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

    func test_url_with_httpMethod() {
        do {
            let result = try XCTUnwrap(sut.createRequestWith(baseURL: endPoint, httpMethod: .POST))
            XCTAssert(result.httpMethod == HTTPMethod.POST.rawValue, "URL method not set properly")
        } catch {
            XCTFail("Request build failed")
        }
    }
    
    func test_url_with_body() {
        let data: [String: Any] = [
            "text": "Born and raised in the charming south, I can add a touch of sweet southern hospitality to your audiobooks and podcasts",
            "model_id": "eleven_monolingual_v1",
            "voice_settings": [
                "stability": 0.5,
                "similarity_boost": 0.5
            ]
        ]
        do {
            let result = try XCTUnwrap(sut.createRequestWith(baseURL: endPoint, body: data))
            XCTAssert(result.httpBody != nil, "Body nil")
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
