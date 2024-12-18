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

                    Text("As an emergency contact, you will receive alert notifications when the person you are caring for experiences a seizure. The alerts may be direct notifications.")
                        .foregroundColor(.baigee)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .padding(.top, 150)
                        .offset(y: 120)

                    Spacer()

                    // NavigationLink to page4 when "متابعة" is clicked
                    NavigationLink(destination: NotificationPage()) {
                        ZStack {
                            Image("strt")
                            Text("continue")
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
