import Foundation

public extension Gen where T: RandomInRangeable {
    /**
     * Returns a generator which produces elements in the provided range
     */
    static func from(_ range: Range<T>) -> Gen {
        assert(!range.isEmpty, "`Gen.from(range:)` was invoked with an empty interval")

        return Gen<T> {
            .random(in: range, using: &$0.rng)
        }
    }

    /**
     * Returns a generator which produces elements in the provided range
     */
    static func from(_ range: ClosedRange<T>) -> Gen {
        assert(!range.isEmpty, "`Gen.from(range:)` was invoked with an empty interval")

        return Gen<T> {
            .random(in: range, using: &$0.rng)
        }
    }
}

/**
 * Indicates a type which can provide random values within a Range
 */
public protocol RandomInRangeable: Comparable {
    static func random<RNG>(in range: ClosedRange<Self>, using generator: inout RNG) -> Self where RNG: RandomNumberGenerator
    static func random<RNG>(in range: Range<Self>, using generator: inout RNG) -> Self where RNG: RandomNumberGenerator
}

extension Int: RandomInRangeable {}
extension Int32: RandomInRangeable {}
extension UInt: RandomInRangeable {}
extension UInt32: RandomInRangeable {}
extension Int64: RandomInRangeable {}
extension Double: RandomInRangeable {}
extension Float: RandomInRangeable {}

extension Character: RandomInRangeable {
    public static func random<RNG>(in range: ClosedRange<Character>, using generator: inout RNG) -> Character where RNG : RandomNumberGenerator {
        Character(
            UnicodeScalar.random(in: range.mapBound {
                $0.unicodeScalars.first!
            }, using: &generator)
        )
    }

    public static func random<RNG>(in range: Range<Self>, using generator: inout RNG) -> Self where RNG: RandomNumberGenerator {
        Character(
            UnicodeScalar.random(in: range.mapBound {
                $0.unicodeScalars.first!
            }, using: &generator)
        )
    }
}

extension UnicodeScalar: RandomInRangeable {
    public static func random<RNG>(in range: ClosedRange<Unicode.Scalar>, using generator: inout RNG) -> Unicode.Scalar where RNG : RandomNumberGenerator {
        Unicode.Scalar(UInt32.random(in: range.mapBound {
            $0.value
        }))!
    }

    public static func random<RNG>(in range: Range<Self>, using generator: inout RNG) -> Self where RNG: RandomNumberGenerator {
        Unicode.Scalar(UInt32.random(in: range.mapBound {
            $0.value
        }))!
    }
}

private extension Range {
    func mapBound<T>(_ fn: (Bound) -> T) -> Range<T> {
        let min = fn(lowerBound)
        let max = fn(upperBound)

        return min..<max
    }
}

private extension ClosedRange {
    func mapBound<T>(using fn: (Bound) -> T) -> ClosedRange<T> {
        let min = fn(lowerBound)
        let max = fn(upperBound)

        return min...max
    }
}