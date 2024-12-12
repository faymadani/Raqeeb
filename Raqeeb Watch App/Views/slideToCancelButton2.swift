//
//  slideToCancelButton2.swift
//  Raqeeb Watch App
//
//  Created by Raghad on 12/12/2024.
//

import SwiftUI

struct slideToCancelButton2: View {
    
    var body: some View {
        @State var hueRotation = false
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(
            LinearGradient(
                colors: [Color.pink.opacity(0.1), Color.background.opacity(0.6)],
                      startPoint: .leading,
                      endPoint: .trailing
                    )
                  )
                  .hueRotation(.degrees(hueRotation ? 20 : -20))
            //text
            Text("اسحب للإلغاء")
                .font(.footnote)
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
            
            
            //thumb
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 50, height: 50)
                   
                Image(systemName: "arrow.left")
                    .foregroundStyle(Color.background)
                
            }
            
            
        }.frame(maxWidth: .infinity,maxHeight: 45)
    }
}

#Preview {
    slideToCancelButton2()
}
