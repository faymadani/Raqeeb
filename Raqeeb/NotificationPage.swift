//
//  page4.swift
//  rageep
//
//  Created by Dana Alghamdi on 12/06/1446 AH.
//

import SwiftUI

struct NotificationPage: View {
    var body: some View {
        ZStack {
            Color.bg
                .ignoresSafeArea()

            VStack {
                Text("للحصول على إشعار!")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(.baigee)
                    .padding(.top, 400)

                Text("يرجى تفعيل الإشعارات الفورية للتنبيهات الطارئه")
                    .foregroundColor(.baigee)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .padding(.top, 10.0)

                Spacer()

                Button(action: {
                    print("تم الضغط على الزر")
                }) {
                    ZStack {
                        Image("strt")
                        Text("تفعيل")
                            .foregroundColor(.bg)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    }
                }
                .navigationBarBackButtonHidden(true)
                .padding(.top, 160)

                Spacer()
            }
        }
    }
}

#Preview {
    NotificationPage()
}
