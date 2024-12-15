//
//  page3.swift
//  rageep
//
//  Created by Dana Alghamdi on 12/06/1446 AH.
//

import SwiftUI

struct EmergencyPage: View {
    var body: some View {
        NavigationView {  // Wrap page3 in a NavigationView as well
            ZStack {
                Color.bg
                    .ignoresSafeArea()

                VStack {
                    Image("map")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .offset(y: 150)

                    Text("بصفتك جهة اتصال للطوارئ، ستتلقى تنبيهات إنذار عندما يتعرض الشخص الذي تعتني به لنوبه صرع. قد تكون التنبيهات عبارة عن إشعارا مباشرا")
                        .foregroundColor(.baigee)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .padding(.top, 150)
                        .offset(y: 120)

                    Spacer()

                    // NavigationLink to page4 when "متابعة" is clicked
                    NavigationLink(destination: page4()) {
                        ZStack {
                            Image("strt")
                            Text("متابعة")
                                .foregroundColor(.bg)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        }
                    }
                    .navigationBarBackButtonHidden(true)
                    .padding(.top, 100)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .padding(.bottom, -80)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    EmergencyPage()
}
