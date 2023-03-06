import Foundation

struct EpisodeLocation: Decodable {
  var latitude: Double { properties.products.origin.first!.properties.latitude }
  var longitude: Double { properties.products.origin.first!.properties.longitude }
  private var properties: RootProperties
  struct RootProperties: Decodable {
    var products: Products
  }
  struct Products: Decodable {
    var origin: [Origin]
  }
  struct Origin: Decodable {
    var properties: OriginProperties
  }
  struct OriginProperties {
    var latitude: Double
    var longitude: Double
  }
}

extension EpisodeLocation.OriginProperties: Decodable {
  private enum OriginPropertiesCodingKeys: String, CodingKey {
    case latitude
    case longitude
  }
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: OriginPropertiesCodingKeys.self)
    let longitude = try container.decode(String.self, forKey: .longitude)
    let latitude = try container.decode(String.self, forKey: .latitude)
    guard let longitude = Double(longitude),
          let latitude = Double(latitude) else { throw EpisodeError.missingData }
    self.longitude = longitude
    self.latitude = latitude
  }
}
