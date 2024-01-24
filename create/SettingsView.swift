//
//  SettingsView.swift
//  create
//
//  Created by Jamie Calub on 1/6/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var backButton : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrowshape.backward.fill")
                    .font(.headline)
                    .frame(width: 40, height: 40)
                    .background(.white)
                    .clipShape(Circle())
                    .foregroundColor(Color(red: 95/255, green: 113/255, blue: 217/255))
                    .padding(.trailing, 20)
            }
        }
    
    
    var body: some View {
        ZStack {
            Color(red: 197/255, green: 206/255, blue: 255/255).ignoresSafeArea()
            Text("Settings View N/A")
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

#Preview {
    SettingsView()
}
