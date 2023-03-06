import Foundation

extension JSONDecoder.DateDecodingStrategy {
  static let iso8601withFractionalSeconds = custom {

    let f = ISO8601DateFormatter().with {
      $0.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    }

    let container = try $0.singleValueContainer()
    let string = try container.decode(String.self)
    if let date = f.date(from: string) {
      return date
    } else {
      throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: " + string)
    }
  }

}
