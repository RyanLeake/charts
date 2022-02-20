import SwiftUI

/// A type of chart that displays a line connecting the data points
public struct LineChart: View, ChartBase {
    public var chartData = ChartData()

    @EnvironmentObject public var chartValue: ChartValue
    @EnvironmentObject var data: ChartData
    @EnvironmentObject var style: ChartStyle


	/// The content and behavior of the `LineChart`.
	///
	///
    public var body: some View {
        ZStack {
            Line(chartValue: chartValue, chartData: data, style: style)
            HStack {
                Spacer()
                VStack {
                    Text(String(data.maxPoint))
                        .opacity(0.5)
                        .font(.system(size: 12))
                        .offset(x: 0, y: -20)
                    Spacer()
                    Text(String(data.minPoint))
                        .opacity(0.5)
                        .font(.system(size: 12))
                        .offset(x: 0, y: 20)
                }
            }
        }
    }
    public init() {}
}

//struct TrendView: View {
//
//    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
//    var demoDataComparison: [Double] = [1, 2, 20, 30, 40, 60, 60]
//
//    @ObservedObject var chartValue = ChartValue()
//
//    var body: some View {
//        VStack {
//
//            LineChart()
//                .data(demoData, demoDataComparison)
//                .environmentObject(chartValue)
//                .chartStyle(ChartStyle(backgroundColor: .clear, foregroundColor: ColorGradient(ChartColors.indicatorKnob, ChartColors.indicatorKnob)))
//                .frame(maxHeight: 100)
//        }
//    }
//}
//
//struct TrendView_Previews: PreviewProvider {
//    static var previews: some View {
//        TrendView()
//    }
//}
