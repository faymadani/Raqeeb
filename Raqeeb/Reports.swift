//
//  Reports.swift
//  Raqeeb
//
//  Created by Fay Turad Madani on 17/06/1446 AH.
//

import Foundation
import SwiftUI
import SwiftData

struct Reports: View {
    @Environment(\.modelContext) private var modelContext  // SwiftData context
    @Query private var nubaItems: [Nuba]  // Fetch existing nuba items from the model
    @State private var showAddSheet = false // to control sheet display
    @State private var type = ""
    @State private var duration = ""
    @State private var date = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Text("النوبات")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {
                        showAddSheet = true
                    }) {
                        Image(systemName: "plus.circle") // plus icon
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)

                if nubaItems.isEmpty {
                    Spacer()
                    Text("لا توجد بيانات")
                        .foregroundColor(.gray)
                        .font(.headline)
                    Spacer()
                } else {
                    ScrollView {
                        VStack(spacing: 15) {
                            ForEach(nubaItems) { nuba in
                                NubaBox(nuba: nuba)
                            }
                        }
                        .padding(.horizontal)
                    }
                }

                Spacer()

                HStack {
                    VStack(spacing: 4) {
                        Image(systemName: "chart.bar.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("التقرير")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)

                    // Add a NavigationLink to wrap the "الرئيسية" button
                    NavigationLink(destination: ContentView()) {
                        VStack(spacing: 4) {
                            Image(systemName: "house.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                            Text("الرئيسية")
                                .font(.caption)
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.1))
            }
            .background(Color("pur").edgesIgnoringSafeArea(.all)) // Set background color
            .sheet(isPresented: $showAddSheet) {
                AddSeizureSheet(
                    type: $type,
                    duration: $duration,
                    date: $date,
                    onSave: {
                        let newNuba = Nuba(type: type, duration: duration, date: date)
                        // Insert new Nuba into the model context
                        modelContext.insert(newNuba)
                        do {
                            try modelContext.save()
                        } catch {
                            print("Failed to save new Nuba: \(error)")
                        }
                        // Reset fields and close the add view
                        showAddSheet = false
                        type = ""
                        duration = ""
                        date = ""
                    }
                )
            }
        }
        .navigationBarBackButtonHidden(true)  // Hide the back button
    }
}


#Preview {
    Reports()
}
import SwiftUI

struct AddSeizureSheet: View {
    @Binding var type: String
    @Binding var duration: String
    @Binding var date: String
    var onSave: () -> Void

    var body: some View {
        ZStack{
            Color.bg
                            .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("إضافة نوبة")
                    .foregroundColor(.white)
                    .font(.title2)
                    .bold()
                    .padding(.top, 20)
                    
                
//                TextField("نوع النوبة", text: $type)
//                    .padding()
//                    .background(Color.gray.opacity(0.1))
//                    .cornerRadius(12)
//                    .padding(.horizontal)
                
                TextField("نوع النوبة", text: $type)
                    .padding()
                    .background(.white)
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                
//                TextField("مدة النوبة", text: $duration)
//                    .padding()
//                    .background(Color.gray.opacity(0.1))
//                    .cornerRadius(12)
//                    .padding(.horizontal)
                
                TextField("مدة النوبة", text: $duration)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                    .padding(.horizontal)
                
//                TextField("تاريخ حصول النوبة", text: $date)
//                    .padding()
//                    .background(Color.gray.opacity(0.1))
//                    .cornerRadius(12)
//                    .padding(.horizontal)
                
                TextField("تاريخ حصول النوبة", text: $date)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                Button(action: {
                    onSave()
                }) {
                    Text("أضف")
                        .frame(width: 200)
                        .padding()
                        .background(.white)
                        .foregroundColor(.B_1)
                        .cornerRadius(25)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
        }
        
    }
}
