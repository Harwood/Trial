import Foundation

/// A class to hold a CacheEntry.
final class CacheEntryObject {
  let entry: CacheEntry
  init(entry: CacheEntry) { self.entry = entry }
}

/// An enumeration of cache quake cache entries.
enum CacheEntry {
  case inProgress(Task<EpisodeLocation, Error>)
  case ready(EpisodeLocation)
}
