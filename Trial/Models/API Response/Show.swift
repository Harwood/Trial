import Foundation
import Alamofire

// MARK: - Show
struct Show: Codable {
  let title, author: String
  let owner: Owner
  let guid: UUID
}

extension Show: Identifiable {
  var id: UUID {
    guid
  }
}
