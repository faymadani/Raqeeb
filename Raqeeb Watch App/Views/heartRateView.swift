//
//  heartRateView.swift
//  Raqeeb Watch App
//
//  Created by Raghad on 13/12/2024.
//


import SwiftUI

struct heartRateView: View {
    var body: some View {
        HStack() {
            Image(systemName: "heart.fill")
                .foregroundStyle(.purple)
                .opacity(0.3)
                
            //change this when you access healthKit
            Text("-- BPM")
                .font(.system(size: 14))
        }.frame(maxWidth: .infinity,alignment: .leading)
         .padding(.horizontal,15)
    }
}

#Preview {
    heartRateView()
}
