import SwiftUI

/// An observable wrapper for an array of data for use in any chart
public class ChartData: ObservableObject {
    @Published public var data: [(String, Double, Color)] = []
    @Published public var comparisonData: [(String, Double, Color)] = []

    var points: [Double] {
        data.map { $0.1 }
    }

    var comparisonPoints: [Double] {
        comparisonData.map { $0.1 }
    }


    var values: [String] {
        data.map { $0.0 }
    }

    var comparisonCalues: [String] {
        comparisonData.map { $0.0 }
    }

    var colors: [Color] {
        data.map { $0.2 }
    }

    var comparisonColors: [Color] {
        comparisonData.map { $0.2 }
    }

    var normalisedPoints: [Double] {
        let absolutePoints = points.map { abs($0) }
        return points.map { $0 / (absolutePoints.max() ?? 1.0) }
    }

    var comparisonNormalisedPoints: [Double] {
        let absolutePoints = comparisonPoints.map { abs($0) }
        return comparisonPoints.map { $0 / (absolutePoints.max() ?? 1.0) }
    }

    var normalisedRange: Double {
        (normalisedPoints.max() ?? 0.0) - (normalisedPoints.min() ?? 0.0)
    }

    var comparisonNormalisedRange: Double {
        (comparisonNormalisedPoints.max() ?? 0.0) - (comparisonNormalisedPoints.min() ?? 0.0)
    }

    var isInNegativeDomain: Bool {
        (points.min() ?? 0.0) < 0
    }

    var comparisonIsInNegativeDomain: Bool {
        (comparisonPoints.min() ?? 0.0) < 0
    }

    /// Initialize with data array
    /// - Parameter data: Array of `Double`
    public init(_ data: [Double]) {
        self.data = data.map { ("", $0, .accentColor) }
    }

    public init(_ data: [Double], _ comparisonData: [Double]) {
        self.data = data.map { ("", $0, .accentColor) }
        self.comparisonData = comparisonData.map { ("", $0, .accentColor) }
    }

    public init(_ data: [(String, Double, Color)]) {
        self.data = data
    }


    public init() {
        self.data = []
    }
}
