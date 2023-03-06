import Foundation
import Alamofire

// MARK: - Episode
struct Episode: Codable {
  let description: String
  let duration: Int
  let enclosure: Enclosure
  let episode: String
  let episodeType: String
  let expires: String?
  let explicit: Bool
  let guid: UUID
  let image: String
  let itunesBlock: String
  let itunesDuration: Int
  let published: String
  let rawDescription: String
//  let itunesDuraiton: Int?
  let title: String

  enum CodingKeys: String, CodingKey {
    case title, description, image, published, guid, duration, episode, episodeType, explicit, rawDescription
    case itunesBlock = "itunes:block"
    case itunesDuration = "itunes:duration"
//    case itunesDuraiton = "itunes:duraiton"
    case enclosure, expires
  }
}

extension Episode: Identifiable {
  var id: UUID {
    guid
  }
}
