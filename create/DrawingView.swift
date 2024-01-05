//
//  DrawingView.swift
//  create
//
//  Created by Jamie Calub on 1/5/24.
//

import Foundation
import SwiftUI

struct DrawingView: View {
    
    @State private var lines = [Line(points: [CGPoint(x: 10, y: 10), CGPoint(x: 100, y: 100)], color: .blue, lineWidth: 0)]
    @State private var selectedColor: Color = .black
    @State private var selectedLineWidth: CGFloat = 1
    @State private var colors = [Color(.red), Color(.green), Color(.blue), Color(.magenta), Color(.yellow), Color(.black), Color(.brown), Color(.orange)]
    
    var body: some View {
    
        VStack {
            Text("please work")
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 10) {
                    ForEach(0..<colors.count, id: \.self) { index in
                        Button {
                            selectedColor = colors[index]
                            print(selectedColor)
                        } label: {
                            Text("")
                                .frame(width: 50, height: 50)
                                .background(colors[index])
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            Canvas { context, size in
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }
            }
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
                let newPoint = value.location
                if value.translation.width + value.translation.height == 0 {
                    lines.append(Line(points: [newPoint], color: selectedColor, lineWidth: 5))
                } else {
                    let index = lines.count - 1
                    lines[index].points.append(newPoint)
                }
            }))
        }
    }
}

#Preview {
    DrawingView()
        .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
}

struct Line {
    var points: [CGPoint] //array of cgpoints
    var color: Color
    var lineWidth: CGFloat
}
