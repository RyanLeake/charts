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

    var comparisonValues: [String] {
        comparisonData.map { $0.0 }
    }

    var colors: [Color] {
        data.map { $0.2 }
    }

    var comparisonColors: [Color] {
        comparisonData.map { $0.2 }
    }

    var allPoints: [Double] {
        return points + comparisonPoints
    }

    var unifiedNormalisedPoints: [Double] {
        return allPoints.map { $0 / (allPoints.max() ?? 1.0) }
    }

    var normalisedPoints: [Double] {
        let absolutePoints = points.map { abs($0) }
        return absolutePoints.map { $0 / (allPoints.max() ?? 999.0)}
    }

    var comparisonNormalisedPoints: [Double] {
        let absolutePoints = comparisonPoints.map { abs($0) }
        return absolutePoints.map { $0 / ( allPoints.max() ?? 999)}
    }

    var normalisedRange: Double {
        (unifiedNormalisedPoints.max() ?? 0.0) - (unifiedNormalisedPoints.min() ?? 0.0)
    }

    var comparisonNormalisedRange: Double {
        (unifiedNormalisedPoints.max() ?? 0.0) - (unifiedNormalisedPoints.min() ?? 0.0)
    }

    var isInNegativeDomain: Bool {
        (points.min() ?? 0.0) < 0
    }

    var comparisonIsInNegativeDomain: Bool {
        (comparisonPoints.min() ?? 0.0) < 0
    }

    var maxPoint: Double {
        let combinedData = points + comparisonPoints
        return combinedData.max() ?? 0.0
    }

    var minPoint: Double {
        let combinedData = points + comparisonPoints
        return combinedData.min() ?? 0.0
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
