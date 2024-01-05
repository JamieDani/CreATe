//
//  ProfilesView.swift
//  create
//
//  Created by Jamie Calub on 1/5/24.
//

import SwiftUI

struct ProfilesView: View {
    
    @State private var profiles = ["Daryl", "Jeffrey", "Jaiden", "Jillian", "Jamie"]
    
    var body: some View {
        ZStack {
            Color(red: 197/255, green: 206/255, blue: 255/255).ignoresSafeArea()
            ScrollView(showsIndicators: true) {
                VStack(spacing: (15)) {
                    ForEach(0..<profiles.count, id: \.self) { index in
                        Button {
                            print("pressed")
                        } label: {
                            Text(profiles[index])
                                .frame(width: UIScreen.screenWidth - 40, height: 100)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
                                .font(.largeTitle)
                                .foregroundColor(Color(red: 4/255, green: 17/255, blue: 99/255))
                        }
                    }
                }
            }
            .padding(.top, 130)
            .padding(.bottom, 50)
            VStack {
                Rectangle()
                    .fill(Color(red: 95/255, green: 113/255, blue: 217/255)).ignoresSafeArea()
                    .frame(width: UIScreen.screenWidth, height: 120)
                Spacer()
                Rectangle()
                    .fill(Color(red: 95/255, green: 113/255, blue: 217/255)).ignoresSafeArea()
                    .frame(width: UIScreen.screenWidth, height: 40)
            }
            
            
            VStack {
                HStack {
                    Text("creATe!")
                        .font(.custom("AmericanTypewriter", size: 72, relativeTo: .largeTitle))
                        .foregroundColor(Color(.white))
                        .padding(.leading, 20)
                        .padding(.top, 20)
                    Spacer()
                    Button {
                        print("pressed")
                    } label: {
                        Image(systemName: "gear")
                            .font(.title)
                            .frame(width: 50, height: 50)
                            .background(.white)
                            .clipShape(Circle())
                            .foregroundColor(Color(red: 95/255, green: 113/255, blue: 217/255))
                            .padding(.trailing, 20)
                    }
                }
                Spacer()
            }
        }
    }
}

extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
#Preview {
    ProfilesView()
}
