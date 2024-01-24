//
//  ProfileOptionsVIew.swift
//  create
//
//  Created by Jamie Calub on 1/6/24.
//

import SwiftUI

struct ProfileOptionsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
            ProfilesView.Colors.lightColor.ignoresSafeArea()
            VStack(spacing: 60) {
                Text(ProfilesView.Profile.currProfile + "'s Profile")
                    .foregroundColor(.white)
                    .font(.custom("AppleSDGothicNeo-Bold", size: 40, relativeTo: .largeTitle))
                    .frame(width: UIScreen.screenWidth - 40, height: 100)
                    .background(ProfilesView.Colors.darkColor)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 5)))
                    .padding(.top, 20)
                
                HStack(spacing: 10) {
                    NavigationLink() {
                        DrawingView()
                    } label: {
                        Text("New Drawing")
                            .font(.custom("AppleSDGothicNeo-Bold", size: 30, relativeTo: .largeTitle))
                            .frame(width: 150, height: 100)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
                            .foregroundColor(Color(red: 4/255, green: 17/255, blue: 99/255))
                    }
                    .padding(.leading, UIScreen.screenWidth/6)
                    Spacer()
                    NavigationLink() {
                        ProfileOptionsView()
                    } label: {
                        Text("View Gallery")
                            .font(.custom("AppleSDGothicNeo-Bold", size: 30, relativeTo: .largeTitle))
                            .frame(width: 150, height: 100)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
                            .foregroundColor(Color(red: 4/255, green: 17/255, blue: 99/255))
                    }
                    .padding(.trailing, UIScreen.screenWidth/6)
                }
                HStack(spacing: 10) {
                    NavigationLink() {
                        ProfileOptionsView()
                    } label: {
                        Text("View Analytics")
                            .font(.custom("AppleSDGothicNeo-Bold", size: 30, relativeTo: .largeTitle))
                            .frame(width: 150, height: 100)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
                            .foregroundColor(Color(red: 4/255, green: 17/255, blue: 99/255))
                    }
                    .padding(.leading, UIScreen.screenWidth/6)
                    Spacer()
                    NavigationLink() {
                        EditMaterialsView()
                    } label: {
                        Text("Edit Materials")
                            .font(.custom("AppleSDGothicNeo-Bold", size: 30, relativeTo: .largeTitle))
                            .frame(width: 150, height: 100)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
                            .foregroundColor(Color(red: 4/255, green: 17/255, blue: 99/255))
                    }
                    .padding(.trailing, UIScreen.screenWidth/6)
                }
                HStack(spacing: 10) {
                    NavigationLink() {
                        ProfileOptionsView()
                    } label: {
                        Text("Edit  Profile")
                            .font(.custom("AppleSDGothicNeo-Bold", size: 30, relativeTo: .largeTitle))
                            .frame(width: 150, height: 100)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
                            .foregroundColor(Color(red: 4/255, green: 17/255, blue: 99/255))
                    }
                    .padding(.leading, UIScreen.screenWidth/6)
                    Spacer()
                    NavigationLink() {
                        ProfileOptionsView()
                    } label: {
                        Text("Delete Profile")
                            .font(.custom("AppleSDGothicNeo-Bold", size: 30, relativeTo: .largeTitle))
                            .frame(width: 150, height: 100)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
                            .foregroundColor(Color(red: 4/255, green: 17/255, blue: 99/255))
                    }
                    .padding(.trailing, UIScreen.screenWidth/6)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

struct ProfileOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileOptionsView()
    }
}

//extension UIScreen {
    //static let screenWidth = UIScreen.main.bounds.size.width
    //static let screenHeight = UIScreen.main.bounds.size.height
    //static let screenSize = UIScreen.main.bounds.size
//}

#Preview {
    ProfileOptionsView()
}
