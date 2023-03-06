import Foundation

enum EpisodeError: Error {
  case missingData
  case networkError
  case unexpectedError(error: Error)
}

extension EpisodeError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .missingData:
      return NSLocalizedString("Discarding an episode missing data.", comment: "")
    case .networkError:
      return NSLocalizedString("Error fetching episode data over the network.", comment: "")
    case .unexpectedError(let error):
      return NSLocalizedString("Received unexpected error. \(error.localizedDescription)", comment: "")
    }
  }
}
