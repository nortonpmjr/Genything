import Foundation

// Public domain data taken from https://www.gutenberg.org/ebooks/3201
struct NameData: Codable {
    let names: [String]
}

extension NameData: JsonResourceCodable {}
