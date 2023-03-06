import SwiftUI

struct EpisodeRow: View {
  var episode: Episode

  var body: some View {
    HStack {
      AsyncImage(url: URL(string: episode.image)){ image in
        image
          .resizable()
          .scaledToFill()
      } placeholder: {
        ProgressView()
      }.frame(width: 44, height: 44)
        .background(Color.gray)
        .clipShape(Circle())

        .clipShape(Circle())
//      Text("Title: \(episode.title)")
      VStack {
        Text(episode.title)
        Text(episode.description)
          .font(.caption)
          .lineLimit(2)
          .truncationMode(.tail)
      }

//      Text("Number: \(episode.episode)")
//      Text("Description: \(episode.description)")
    }
  }
}

struct EpisodeRow_Previews: PreviewProvider {
  static let previewEpisode = Episode(
    description: "The Dispatch tells stories about and celebrates the successes of your fellow DAs. In this first episode, you’ll hear the 3 stories below. 03:08- Elisha I., a DA who found herself at the right place at the right time while running her route. 08:52- Shane P., who shares his path from DA to General Manager of HieQ Logistics. 19:43- Tyrus C., a DA who also happens to be a Grammy-nominated recording artist.",
    duration: 2510,
          enclosure: Enclosure (
            source: "56c14bc4-74a0-4115-815c-a2fb05e0554d",
            length: 25051892,
            type: "",
            url: ""
          ),
          episode: "1",
          episodeType: "full",
          expires: nil,
          explicit: false,
    guid: UUID(uuidString: "d385e1bc-5f17-4b7e-9c2a-58f4d1c766ed")!,
          image: "https://pkg.trystoryboard.com/img/thedispatch.png",
          itunesBlock: "yes",
//          itunesDuraiton: nil,
          itunesDuration: 2510,
          published: "2022-09-06T02:00:00.000Z",
          rawDescription: "The Dispatch tells stories about and celebrates the successes of your fellow DAs. In this first episode, you’ll hear the 3 stories below. 03:08- Elisha I., a DA who found herself at the right place at the right time while running her route. 08:52- Shane P., who shares his path from DA to General Manager of HieQ Logistics. 19:43- Tyrus C., a DA who also happens to be a Grammy-nominated recording artist.",

    title: "Driving Your Future"
  )

  static var previews: some View {
    EpisodeRow(episode: previewEpisode)
      .previewLayout(.sizeThatFits)
  }
}
