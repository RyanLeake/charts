import SwiftUI

/// Protocol for any type of chart, to get access to underlying data
public protocol ChartBase {
    var chartData: ChartData { get }
}

public protocol ComparativeChartBase: ChartBase {
    var comparisonChartData: ChartData { get }
}
