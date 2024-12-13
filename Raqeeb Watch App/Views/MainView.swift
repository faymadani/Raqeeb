//
//  ContentView.swift
//  RaqeebForWatchOs Watch App
//
//  Created by Raghad on 11/12/2024.
//

import SwiftUI

struct mainView: View {
    var body: some View {
        NavigationView {
            
        Color("Background")
           .ignoresSafeArea()
           .overlay {
               VStack {
                   
                   heartRateView()
                   
                   Button(action: startMonitiring , label: {
                       ZStack{
                           Image("bubble")
                               .resizable()
                               .scaledToFit()
                               .frame(height: 140)
                              
                               
                           Text("تنبيه")
                               .font(.system(size: 22, weight: .bold))
                           
                       }
                       
                   })
                   .buttonStyle(PlainButtonStyle())
                   .buttonStyle(BorderedButtonStyle(tint: .blue))
                                  
              
                   
                   Button(action: startMonitiring , label: {
                       Text("بدء المراقبة")
                           .font(.system(size: 20, weight: .regular))
                           .foregroundColor(.background)
                           
                   }).background(Color.white)
                       .cornerRadius(50)
               }
           }
        }
    }
    
    func startMonitiring(){
        
    }
}

#Preview {
    mainView()
}
