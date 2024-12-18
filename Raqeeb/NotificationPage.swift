//
//  page4.swift
//  rageep
//
//  Created by Dana Alghamdi on 12/06/1446 AH.
//

import SwiftUI
import UserNotifications

struct NotificationPage: View {
    var body: some View {
        ZStack {
            Color.bg
                .ignoresSafeArea()

            VStack {
                Text("To receive a notification!")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(.baigee)
                    .padding(.top, 400)

                Text("Please enable push notifications for emergency alerts.")
                    .foregroundColor(.baigee)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .padding(.top, 10.0)

                Spacer()

                Button(action: {
                    // استدعاء طلب إذن الإشعارات عند الضغط على الزر
                    requestNotificationPermission()
                }) {
                    ZStack {
                        Image("strt") // صورة "strt"
                        Text("Activate")
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

    // دالة لطلب الإذن بإشعارات التطبيق
    func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("خطأ في طلب الإذن بالإشعارات: \(error.localizedDescription)")
            } else if granted {
                print("تم منح الإذن بالإشعارات.")
            } else {
                print("تم رفض الإذن بالإشعارات.")
            }
        }
    }
}

#Preview {
    NotificationPage()
}
