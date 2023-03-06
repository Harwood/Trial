//
//  TrialApp.swift
//  Trial
//
//  Created by Developer on 3/4/23.
//

import SwiftUI

@main
struct TrialApp: App {
    let persistenceController = PersistenceController.shared
  @StateObject var episodeProvider = EpisodeProvider()

  // yBKstJ7RXk9EpVmpPhndKaECsUQU0OqP

    var body: some Scene {
        WindowGroup {
          NavigationView {
            ContentView()
              .environmentObject(episodeProvider)
          }
        }
    }
}
