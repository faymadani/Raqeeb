//
//  AddNubaView.swift
//  Raqeeb
//
//  Created by Fay Turad Madani on 17/06/1446 AH.
//

import Foundation
import SwiftUI
import SwiftData
struct AddNubaView: View {
    @Environment(\.dismiss) var dismiss          // لإغلاق الصفحة
    @Binding var nubaType: String
    @Binding var nubaDuration: String
    @Binding var nubaDate: String
    var onSave: () -> Void // دالة الحفظ التي سيتم تمريرها

    @State private var showTypeSheet: Bool = false
    @State private var showDurationSheet: Bool = false
    @State private var showDateSheet: Bool = false

    var body: some View {
        VStack(alignment: .trailing, spacing: 20) {
            // العنوان
            Text("النوبات")
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center) // جعل النص في الوسط ونزله شوي
                .padding(.top, 40) // نزول النص قليلاً

            // حقول إدخال البيانات
            VStack(alignment: .trailing, spacing: 15) {
                // نوع النوبة
                HStack {
                    Text("نوع النوبة:")
                        .foregroundColor(.white)
                    Button(action: {
                        showTypeSheet.toggle()
                    }) {
                        Text(nubaType.isEmpty ? "أدخل نوع النوبة" : nubaType)
                            .foregroundColor(.white)
                    }
                    .sheet(isPresented: $showTypeSheet) {
                        TextField("أدخل نوع النوبة", text: $nubaType)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }

                // مدة النوبة
                HStack {
                    Text("مدة النوبة:")
                        .foregroundColor(.white)
                    Button(action: {
                        showDurationSheet.toggle()
                    }) {
                        Text(nubaDuration.isEmpty ? "أدخل مدة النوبة" : nubaDuration)
                            .foregroundColor(.white)
                    }
                    .sheet(isPresented: $showDurationSheet) {
                        TextField("أدخل مدة النوبة", text: $nubaDuration)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }

                // تاريخ النوبة
                HStack {
                    Text("تاريخ النوبة:")
                        .foregroundColor(.white)
                    Button(action: {
                        showDateSheet.toggle()
                    }) {
                        Text(nubaDate.isEmpty ? "أدخل تاريخ النوبة" : nubaDate)
                            .foregroundColor(.white)
                    }
                    .sheet(isPresented: $showDateSheet) {
                        TextField("أدخل تاريخ النوبة", text: $nubaDate)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
            }

            // زر الحفظ
            Button(action: saveNuba) {
                Label("حفظ", systemImage: "checkmark.circle.fill")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.top, 10)

            Spacer()
        }
        .padding()
        .background(Color("pur")) // تعيين الخلفية للون "pur" من Assets
        .edgesIgnoringSafeArea(.all)
    }

    private func saveNuba() {
        onSave() // استدعاء دالة الحفظ الممررة
        dismiss() // إغلاق الصفحة بعد الحفظ
    }
}

