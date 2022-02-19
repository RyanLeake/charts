import SwiftUI

extension View where Self: ChartBase {
	
	/// Set data for a chart
	/// - Parameter data: array of `Double`
	/// - Returns: modified `View` with data attached
    public func data(_ data: [Double]) -> some View {
        chartData.data = data.map { ("", $0, .accentColor) }
        return self
            .environmentObject(chartData)
            .environmentObject(ChartValue())
    }

    public func data(_ data: [(String, Double, Color)]) -> some View {
        chartData.data = data
        return self
            .environmentObject(chartData)
            .environmentObject(ChartValue())
    }
}

extension View where Self: ComparativeChartBase {
    public func data(_ data: [Double], _ comparisonData: [Double]) -> some View {
        chartData.data = data.map { ("", $0, .accentColor) }
        comparisonChartData.data = comparisonData.map { ("", $0, .accentColor) }

        return self
            .environmentObject(chartData)
            .environmentObject(comparisonChartData)
            .environmentObject(ChartValue())
    }
}
