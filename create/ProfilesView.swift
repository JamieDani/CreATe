//
//  ProfilesView.swift
//  create
//
//  Created by Jamie Calub on 1/5/24.
//

import SwiftUI

struct ProfilesView: View {
    @State private var profiles = ["Client 1", "Client 2", "Client 3", "Client 4"]
    @State public var currentProfile = "None"
    
    //let allProfileObj: AllProfiles = AllProfiles()
    //allProfileObj.myProfiles = [MyProfile(name: "hi")]
    
    @State private var showingAlert = false
    @State private var newProfile = ""
    
    struct Profile {
        static var currProfile = "None"
        static var fullBrushset = ["pen", "marker", "eraser"]
        static var fullBrushsetIcons = ["pencil.line", "highlighter", "eraser"]
        static var currBrushset = [true, true, true]
        static var fullColorset = [Color(.red), Color(.green), Color(.blue), Color(.magenta), Color(.yellow), Color(.black), Color(.brown), Color(.orange)]
        static var fullColorsetString = ["red", "green", "blue", "magenta", "yellow", "black", "brown", "orange"]
        static var currColorset = [true, true, true, true, true, true, true, true]
    }
    
    struct Colors {
        @State static var darkColor = Color(red: 95/255, green: 113/255, blue: 217/255)
        @State static var lightColor = Color(red: 197/255, green: 206/255, blue: 255/255)
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color(Colors.lightColor).ignoresSafeArea()
                ScrollView(showsIndicators: true) {
                    VStack(spacing: (15)) {
                        ForEach(0..<profiles.count, id: \.self) { index in
                            NavigationLink() {
                                ProfileOptionsView()
                            } label: {
                                Text(profiles[index])
                                    .font(.custom("AppleSDGothicNeo-Bold", size: 43, relativeTo: .largeTitle))
                                    .frame(width: UIScreen.screenWidth - 40, height: 100)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
                                    .foregroundColor(Color(red: 4/255, green: 17/255, blue: 99/255))
                            }.simultaneousGesture(TapGesture().onEnded {
                                Profile.currProfile = profiles[index]
                            })
                        }
                        
                        Button() {
                            showingAlert.toggle()
                        } label: {
                            Text("Create New Profile +")
                                .frame(width: UIScreen.screenWidth - 40, height: 100)
                                .font(.custom("AppleSDGothicNeo-Bold", size: 30, relativeTo: .largeTitle))
                                .background(Colors.darkColor)
                                .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
                                .font(.largeTitle)
                                .foregroundColor(Color(.white))
                        }
                        .alert("Create new profile", isPresented: $showingAlert) {
                            TextField("Enter profile name", text: $newProfile)
                            Button("OK", action: submit)
                        }
                    }
                }
                .padding(.top, 130)
                .padding(.bottom, 50)
                VStack {
                    Rectangle()
                        .fill(Colors.darkColor).ignoresSafeArea()
                        .frame(width: UIScreen.screenWidth, height: 120)
                    Spacer()
                    Rectangle()
                        .fill(Colors.darkColor).ignoresSafeArea()
                        .frame(width: UIScreen.screenWidth, height: 40)
                }
                VStack {
                    HStack {
                        Text("creATe!")
                            .font(.custom("AppleSDGothicNeo-Bold", size: 78, relativeTo: .largeTitle))
                            .foregroundColor(Color(.white))
                            .padding(.leading, 20)
                            .padding(.top, 20)
                        Spacer()
                        NavigationLink() {
                            SettingsView()
                        } label: {
                            Image(systemName: "gear")
                                //.navigationBarBackButtonHidden(true)
                                .font(.title)
                                .frame(width: 50, height: 50)
                                .background(.white)
                                .clipShape(Circle())
                                .foregroundColor(Colors.darkColor)
                                .padding(.trailing, 20)
                        }
                        .navigationDestination(for: String.self) { view in
                            if view == "SettingsView" {
                                SettingsView()
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
    }
    
    func submit() {
        profiles.append(newProfile)
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
