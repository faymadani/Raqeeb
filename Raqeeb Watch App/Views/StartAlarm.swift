//
//  StartAlarm.swift
//  Raqeeb Watch App
//
//  Created by Raghad on 12/12/2024.
//

import SwiftUI

struct StartAlarm: View {
    @State private var showCancel: Bool = false
    var body: some View {
        Color("Background")
           .ignoresSafeArea()
           .overlay {
               VStack {
                   if showCancel {
                       slideToCancelButton2()
                           .transition(AnyTransition.scale.animation(Animation.spring(response: 0.3,dampingFraction: 0.5)))
                   }
               }.padding()
               .onAppear {
                   self.showCancel = true
                       
               }
           }
    }
}

#Preview {
    StartAlarm()
}
