import Foundation
import Alamofire

// MARK: - Enclosure
struct Enclosure: Codable {
  let source: String
  let length: Int
  let type: String
  let url: String
}
