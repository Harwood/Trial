import Alamofire
import Foundation

// MARK: - Feed

struct Feed: Codable {
  let show: Show
  let episodes: [Episode]
}
