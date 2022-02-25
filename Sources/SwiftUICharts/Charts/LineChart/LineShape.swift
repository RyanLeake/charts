import SwiftUI

struct LineShape: Shape {
    var data: ChartData
    func path(in rect: CGRect) -> Path {
        let path = Path.quadCurvedPathWithPoints(data: data, step: CGPoint(x: 1.0, y: 1.0))
        return path
    }
}


struct LineShapeComparison: Shape {
    var data: ChartData
    func path(in rect: CGRect) -> Path {
        let path = Path.quadCurvedPathWithPointsComparison(data: data, step: CGPoint(x: 1.0, y: 1.0))
        return path
    }
}


