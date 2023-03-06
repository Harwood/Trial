//
//  EpisodeProvider.swift
//  Trial
//
//  Created by Developer on 3/4/23.
//

import Foundation

@MainActor
class EpisodeProvider: ObservableObject {

  @Published var episodes: [Episode] {
    didSet {
      print("Episodes: \(self.episodes)")
    }
  }

  private let client: EpisodeClient

  func fetchEpisodes() async throws {
    if let latestEpisodes = try? await client.episodes {
      self.episodes = latestEpisodes

      print(self.episodes)
    } else {
      throw EpisodeError.missingData
    }


  }

  init(client: EpisodeClient = EpisodeClient()) {
    self.episodes = []
    
    self.client = client
  }
}
