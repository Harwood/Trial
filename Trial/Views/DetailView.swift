//
//  DetailView.swift
//  Trial
//
//  Created by Invictus on 3/6/23.
//

import Foundation
import SwiftUI
import AVFoundation


struct DetailView: View {
  @ObservedObject var model = Model.shared

  @Binding var isPresentingEpisodeDetailsView: Bool

  let soundFileURL = Bundle.main.url(
    forResource: "output4", withExtension: "caf"
  )

  var body: some View {
    VStack {
      AsyncImage(url: URL(string: model.currentEpisodeInDetails!.image)){ image in
        image
          .resizable()
          .scaledToFill()
      } placeholder: {
        ProgressView()
      }.frame(width: 88, height: 88)
        .background(Color.gray)
        .clipShape(Circle())

      Text(model.currentEpisodeInDetails!.title)
        .font(.title)

      Spacer()

      Text(model.currentEpisodeInDetails!.description)

      Spacer()

//      PlayerContainerView(player: AVPlayer(url: soundFileURL!))

      HStack {
        Button(action: {
//          isPresentingEpisodeDetailsView = false
          self.model.currentEpisodePlaying = self.model.currentEpisodeInDetails
          self.model.player = AVPlayer(url: URL(string:self.model.currentEpisodePlaying!.enclosure.url)!)
          self.model.player?.play()
        }) {
          Image(systemName: "play.fill")
        }

        Spacer()
        
        Button(action: {
          isPresentingEpisodeDetailsView = false
          self.model.player?.pause()
          self.model.player = nil
          self.model.currentEpisodePlaying = nil
        }) {
          Image(systemName: "stop.fill")
        }
      }
      .padding()
    }
    .onDisappear {
      model.currentEpisodeInDetails = nil
    }
    .padding()
  }
}

struct DetailView_Previews: PreviewProvider {
  @State static var isPresentingEpisodeDetailsView = true
  static var previews: some View {
    DetailView(isPresentingEpisodeDetailsView: $isPresentingEpisodeDetailsView)
  }
}
