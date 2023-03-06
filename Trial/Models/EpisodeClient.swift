//
//  EpisodeClient.swift
//  Trial
//
//  Created by Developer on 3/4/23.
//
import Alamofire
import Foundation
import Then

extension URLRequest: Then {}

actor EpisodeClient {
  private let episodeCache: NSCache<NSString, CacheEntryObject> = NSCache()

  private lazy var decoder: JSONDecoder = {
    let aDecoder = JSONDecoder()
    aDecoder.dateDecodingStrategy = .millisecondsSince1970
    return aDecoder
  }()

  private let downloader: any HTTPDataDownloader

  var episodes: [Episode] {
    get async throws {
      var request = URLRequest(url: URL(string: "https://api.audio1st.net/user-management/podcore?organizationId=1010828a-7510-4141-8737-d280edf95c6d&expired=true")!)
      request.setValue("Bearer PaVk37t0pSZ789XwY2qwDBTOR4sAE7wx", forHTTPHeaderField: "Authorization")
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")

      do {
      
      let data = try await downloader.httpData(for: request)
      let decoded = try decoder.decode(Feed.self, from: data).episodes

      return decoded
    } catch {
        throw EpisodeError.networkError
      }
    }
  }

  init(downloader: any HTTPDataDownloader = URLSession.shared) {
    self.downloader = downloader
  }

//  func episodeLocation(from url: URL) async throws -> EpisodeLocation {
//    if let cached = episodeCache[url] {
//      switch cached {
//      case .ready(let location):
//        return location
//      case .inProgress(let task):
//        return try await task.value
//      }
//    }
//
//    let task = Task<EpisodeLocation, Error> {
//      let data = try await downloader.httpData(for: request)
//      let location = try decoder.decode(EpisodeLocation.self, from: data)
//      return location
//    }
//
//    episodeCache[url] = .inProgress(task)
//
//    do {
//      let location = try await task.value
//      episodeCache[url] = .ready(location)
//      return location
//    } catch {
//      episodeCache[url] = nil
//      throw error
//    }
//  }
}
