//import Alamofire
import Foundation


let validStatus = 200...299
/// A protocol describing an HTTP Data Downloader.
protocol HTTPDataDownloader {
  func httpData(from url: URL) async throws -> Data
  func httpData(for request: URLRequest) async throws -> Data
}

extension URLSession: HTTPDataDownloader {
  func httpData(from url: URL) async throws -> Data {
    guard let (data, response) = try await self.data(from: url, delegate: nil) as? (Data, HTTPURLResponse),
          validStatus.contains(response.statusCode) else {
      throw EpisodeError.networkError
    }
    print(data)
    return data
  }

  func httpData(for request: URLRequest) async throws -> Data {
    guard let (data, response) = try await self.data(for: request, delegate: nil) as? (Data, HTTPURLResponse),
          validStatus.contains(response.statusCode) else {
      throw EpisodeError.networkError
    }
    print(response.statusCode)
    print(data)
    return data
  }
}
