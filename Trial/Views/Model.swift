//
//  Model.swift
//  Trial
//
//  Created by Invictus on 3/6/23.
//

import AVFoundation
import Foundation

class Model: ObservableObject {
  static var shared = Model()

  @Published var currentEpisodePlaying: Episode?
  @Published var currentEpisodeSelected: Episode?

  @Published var player: AVPlayer?

  @Published var currentEpisodeInDetails: Episode?
}
