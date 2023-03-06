import AVFoundation
import SwiftUI


struct PlayerControllerBar: View {
  @ObservedObject var model = Model.shared

  var body: some View {
    VStack {
//      PlayerContainerView(player: model.player!)
      HStack {
        Text(model.currentEpisodePlaying?.title ?? "")
      }
    }
  }
}

struct PlayerControllerBar_Previews: PreviewProvider {
  static var previews: some View {
    PlayerControllerBar()
      .previewLayout(.sizeThatFits)
      .environmentObject(Model())
  }
}

class PlayerUIView: UIView {
  private let playerLayer = AVPlayerLayer()
  init(player: AVPlayer) {
    super.init(frame: .zero)
    playerLayer.player = player
    layer.addSublayer(playerLayer)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

struct PlayerView: UIViewRepresentable {
  let player: AVPlayer
  func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
  }
  func makeUIView(context: Context) -> UIView {
    return PlayerUIView(player: player)
  }
}

struct PlayerContainerView : View {
  private let player: AVPlayer
  init(player: AVPlayer) {
    self.player = player
  }
  var body: some View {
    VStack {
      PlayerView(player: player)
      PlayerControlsView(player: player)
    }
  }
}

struct PlayerControlsView : View {
  @State var playerPaused = true
  let player: AVPlayer
  var body: some View {
    Button(action: {
      self.playerPaused.toggle()
      if self.playerPaused {
        self.player.pause()
      }
      else {
        self.player.play()
      }
    }) {
      Image(systemName: playerPaused ? "play" : "pause")
    }
  }
}
