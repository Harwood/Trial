//
//  ContentView.swift
//  Trial
//
//  Created by Developer on 3/4/23.
//

import SwiftUI
import CoreData
import StoreKit

struct ContentView: View {
  @Environment(\.scenePhase) var scenePhase


  @State private var isPresentingEpisodeDetailsView = false


  @ObservedObject var model = Model.shared

  @EnvironmentObject var episodeProvider: EpisodeProvider

  var body: some View {

      TabView {
        VStack {
          NavigationView {
            List {
              ForEach(episodeProvider.episodes, id: \.id) { episode in
                EpisodeRow(episode: episode).onTapGesture {
                  self.isPresentingEpisodeDetailsView = true
                  self.model.currentEpisodeSelected = episode
                  self.model.currentEpisodeInDetails = episode
                }
              }
            }
            .navigationBarTitle(Text("Feed"), displayMode: .automatic)
            .refreshable(action: {
              try? await episodeProvider.fetchEpisodes()
            })
            .sheet(isPresented: $isPresentingEpisodeDetailsView) {
              NavigationView {
                DetailView(isPresentingEpisodeDetailsView: $isPresentingEpisodeDetailsView)
              }
            }

          }
          .onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
              break
            case .background:
              break
            case .inactive:
              break
            @unknown default:
              break
            }
          }
          .task {
            //      do {
            try? await episodeProvider.fetchEpisodes()
            //      } catch {
            //        throw EpisodeError.missingData
            //      }
          }

          if model.currentEpisodePlaying != nil {

            PlayerControllerBar()
              .environmentObject(model)
              .onTapGesture {
                self.isPresentingEpisodeDetailsView = true
                self.model.currentEpisodeInDetails = self.model.currentEpisodePlaying
              }
          }

        }
        .tabItem {
          VStack {
            Text("Feed")
          }
        }
      }
  }
}
