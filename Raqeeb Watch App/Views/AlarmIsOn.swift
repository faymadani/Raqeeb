//
//  AlarmIsOn.swift
//  Raqeeb Watch App
//
//  Created by Raghad on 15/12/2024.
//

import SwiftUI

struct AlarmIsOn: View {
    var body: some View {
       
               VStack{
                   Text("تم إرسال طلب المساعدة")
                       .padding(.bottom,16)
                   Text("الإشعار نشط الآن")
                       .font(.system(size: 25, weight: .bold))
                   Spacer()
                   Button(action: {
                       stopAlarm()
                   },
                          label: {
                       Text("تعطيل")
                           .font(.system(size: 20, weight: .regular))
                           .foregroundColor(.background)
                           
                   }).background(Color.white)
                       .cornerRadius(50)
               }
                   
           
    }
    
    func stopAlarm(){
        // Stop the alarm
    }
    
}

#Preview {
    AlarmIsOn()
}
