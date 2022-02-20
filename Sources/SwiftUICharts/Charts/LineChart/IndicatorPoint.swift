import SwiftUI

/// A dot representing a single data point as user moves finger over line in `LineChart`
struct IndicatorPoint: View {
    @ObservedObject var chartValue: ChartValue

	/// The content and behavior of the `IndicatorPoint`.
	///
	/// A filled circle with a thick white outline and a shadow
    public var body: some View {
            ZStack {
                ZStack {


                Circle()
                    .fill(ChartColors.indicatorKnob)
                    if #available(iOS 15.0, *) {
                        Circle()
                            .stroke(.background, style: StrokeStyle(lineWidth: 4))
                    } else {
                        Circle()
                            .stroke(.white, style: StrokeStyle(lineWidth: 4))
                    }
                }
                .frame(width: 14, height: 14)

                Text(String(chartValue.currentValue))
                    .offset(x: 0, y: -20)
                    .rotationEffect(.degrees(180), anchor: .center)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }


    }
}

struct IndicatorPoint_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorPoint(chartValue: ChartValue())
    }
}
