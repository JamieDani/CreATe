//
//  EditMaterialsView.swift
//  create
//
//  Created by Jamie Calub on 1/10/24.
//

import SwiftUI

struct EditMaterialsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var cbset = ProfilesView.Profile.currBrushset
    @State var ccset = ProfilesView.Profile.currColorset
    //@State var ctset = ProfilesView.Profile.currToolset
    
    var backButton : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrowshape.backward.fill")
                    .font(.headline)
                    .frame(width: 40, height: 40)
                    .background(.white)
                    .clipShape(Circle())
                    .foregroundColor(ProfilesView.Colors.darkColor)
                    .padding(.trailing, 20)
            }
        }
    
    var body: some View {
        ZStack {
            Color(red: 197/255, green: 206/255, blue: 255/255).ignoresSafeArea()
            VStack(spacing: 20) {
                Spacer()
                Text(ProfilesView.Profile.currProfile + "'s Materials")
                    .foregroundColor(.white)
                    .font(.custom("AppleSDGothicNeo-Bold", size: 40, relativeTo: .largeTitle))
                    .frame(width: UIScreen.screenWidth - 40, height: 100)
                    .background(Color(red: 95/255, green: 113/255, blue: 217/255))
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 5)))
                    .padding(.top, 20)
                Spacer()
               //brushes
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 20) {
                        ForEach(0..<ProfilesView.Profile.fullBrushset.count, id: \.self) { index in
                            Button( action: {
                                ProfilesView.Profile.currBrushset[index] = (ProfilesView.Profile.currBrushset[index] == true ? false : true)
                                cbset[index] = (cbset[index] == true ? false : true)
                                print("set to " + String(ProfilesView.Profile.currBrushset[index]))
                                
                            }) {
                                VStack {
                                    Image(systemName: ProfilesView.Profile.fullBrushsetIcons[index])
                                        .resizable()
                                        .scaleEffect(CGSize(width: 0.7, height: 0.7))
                                        .frame(width: 100, height: 100)
                                        .background(cbset[index] == true ? Color(red: 95/255, green: 113/255, blue: 217/255) : Color(red: 197/255, green: 206/255, blue: 255/255))
                                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                                        .foregroundColor(.white)
                                    Text(ProfilesView.Profile.fullBrushset[index])
                                        .foregroundColor(Color(red: 95/255, green: 113/255, blue: 217/255))
                                        .font(.custom("AppleSDGothicNeo-Bold", size: 20, relativeTo: .largeTitle))
                                }
                            }
                            
                            
                        }
                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                Spacer()
                //colors
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 20) {
                        ForEach(0..<ProfilesView.Profile.fullColorset.count, id: \.self) { index in
                            Button( action: {
                                ProfilesView.Profile.currColorset[index] =
                                (ProfilesView.Profile.currColorset[index] ? false : true)
                                ccset[index] = (ccset[index] ? false : true)
                                print("set to " + String(ProfilesView.Profile.currColorset[index]))
                            }) {
                                VStack {
                                    Image(systemName: (ccset[index] ? "checkmark.circle" : "circle"))
                                        .resizable()
                                        .scaleEffect(CGSize(width: 0.7, height: 0.7))
                                        .frame(width: 100, height: 100)
                                        .background(ProfilesView.Profile.fullColorset[index])
                                        .clipShape(Circle())
                                        .foregroundColor(ccset[index] ? Color(red: 95/255, green: 113/255, blue: 217/255) : Color(red: 197/255, green: 206/255, blue: 255/255))
                                    Text(String(ProfilesView.Profile.fullColorsetString[index]))
                                        .foregroundColor(Color(red: 95/255, green: 113/255, blue: 217/255))
                                        .font(.custom("AppleSDGothicNeo-Bold", size: 20, relativeTo: .largeTitle))
                                }
                                    
                            }
                        }
                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                Spacer()
                //special tools
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 20) {
                        ForEach(0..<ProfilesView.Profile.fullBrushset.count, id: \.self) { index in
                            Button {
                                print("TBD")
                            } label: {
                                Text("TBD")
                                    .frame(width: 100, height: 100)
                                    .background(Color(red: 95/255, green: 113/255, blue: 217/255))
                                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

#Preview {
    EditMaterialsView()
}
