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
    @State private var selectedBrush: String = "pen"
    //import custom shape to make other types of lines, string as placeholder
    @State private var selectedLineWidth: CGFloat = 1
    @State var colors = ProfilesView.Profile.fullColorset
    @State var ccs = ProfilesView.Profile.currColorset
    @State var brushes = ProfilesView.Profile.fullBrushset
    @State var cbs = ProfilesView.Profile.currBrushset
    
    @State var showingBrushSettings = true
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var backButton : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        Image(systemName: "arrowshape.backward.fill")
            .frame(width: 40, height: 40)
            .background(.white)
            .clipShape(Circle())
            .foregroundColor(ProfilesView.Colors.darkColor)
    }
    }
    
    var body: some View {
        NavigationStack() {
            //COLLAPSABLE MENU
            VStack {
                Section(
                    header: BrushSettingsHeaderView(
                        //title: "Brush Settings",
                        isOn: $showingBrushSettings,
                        onLabel: "HIDE TOOLS",
                        offLabel: "SHOW TOOLS"
                    )
                ){
                    if showingBrushSettings {
                        Text("Color")
                            .padding(.top, 10)
                            .font(.custom("AppleSDGothicNeo-Bold", size: 30, relativeTo: .title))
                            .foregroundColor(.white)
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack(spacing: 10) {
                                ForEach(0..<ccs.count, id: \.self) { index in
                                    if(ccs[index]) {
                                        Button {
                                            selectedColor = colors[index]
                                            print(selectedColor)
                                        } label: {
                                            Text("")
                                                .frame(width: 50, height: 50)
                                                .background(colors[index])
                                                .clipShape(Circle())
                                                .overlay(Circle()
                                                    .stroke(Color.white, lineWidth: 3))
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        
                        Text("Brushes")
                            .padding(.top, 10)
                            .font(.custom("AppleSDGothicNeo-Bold", size: 30, relativeTo: .title))
                            .foregroundColor(.white)
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack(spacing: 10) {
                                ForEach(0..<cbs.count, id: \.self) { index in
                                    if(cbs[index]) {
                                        Button {
                                            selectedBrush = brushes[index]
                                            print(selectedBrush)
                                        } label: {
                                            Image(systemName: ProfilesView.Profile.fullBrushsetIcons[index])
                                                .resizable()
                                                .scaleEffect(CGSize(width: 0.6, height: 0.6))
                                                .frame(width: 50, height: 50)
                                                .background(Color(red: 197/255, green: 206/255, blue: 255/255))
                                                .clipShape(Circle())
                                                .foregroundColor(Color(red: 95/255, green: 113/255, blue: 217/255))
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.bottom, 10) //whatever the last brush is put space
                        
                    }
                }
            }
            .background(Color(red: 95/255, green: 113/255, blue: 217/255))
            //
            
            ZStack {
                Color(red: 197/255, green: 206/255, blue: 255/255).ignoresSafeArea()
                VStack {
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
            .navigationBarHidden(true)
        }
        .navigationBarTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

struct BrushSettingsHeaderView: View {
    
    @Binding  var isOn: Bool
    @State var onLabel: String
    @State var offLabel: String
    
    var body: some View {
        ZStack {
            Button(action: {
                withAnimation {
                    isOn.toggle()
                }
            }, label: {
                if isOn {
                    Text(onLabel)
                } else {
                    Text(offLabel)
                }
            })
            .font(Font.caption)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}
    
#Preview {
    DrawingView()
}

struct Line {
    var points: [CGPoint]
    var color: Color
    var lineWidth: CGFloat
}
    
