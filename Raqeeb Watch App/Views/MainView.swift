//
//  ContentView.swift
//  RaqeebForWatchOs Watch App
//
//  Created by Raghad on 11/12/2024.
//

import SwiftUI

struct mainView: View {
    @State private var startAlert: Bool = false
    var body: some View {
        NavigationView {
            
        Color("Background")
           .ignoresSafeArea()
           .overlay {
               VStack {
                   
                   heartRateView()
                   Spacer()
                   Button(action:
                            {
                       startAlert = true}
                            
                           , label: {
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
                   Spacer()
                   //Text("")
                   
               }.padding()
                .ignoresSafeArea()
                   
           }
           
        }.navigationDestination(isPresented: $startAlert) {
            StartAlarm()
        }
    }
    
    func startMonitiring(){
        
    }
}

#Preview {
    mainView()
}
