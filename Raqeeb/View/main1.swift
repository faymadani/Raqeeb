//
//  main.swift
//  Raqeeb
//
//  Created by Fay Turad Madani on 11/06/1446 AH.
//

import SwiftUI


struct MainView: View {
    var body: some View {
        VStack {
            // الجزء العلوي: الترحيب
            VStack(alignment: .leading, spacing: 8) {
                Text("أهلا محمد")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("كيف حال صحتك اليوم؟")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding()
            
            Spacer().frame(height: 20)
            
            // جهات الاتصال
            VStack(alignment: .leading, spacing: 10) {
                Text("جهات الاتصال")
                    .font(.headline)
                    .foregroundColor(.white)
                
                HStack {
                    Image(systemName: "phone.fill")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.white.opacity(0.2))
                        .clipShape(Circle())
                    
                    Text("أمي")
                        .font(.body)
                        .foregroundColor(.white)
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.1))
                .cornerRadius(12)
            }
            .padding(.horizontal)
            
            Spacer().frame(height: 20)
            
            // النوبات
            VStack(alignment: .leading, spacing: 10) {
                Text("النوبات")
                    .font(.headline)
                    .foregroundColor(.white)
                
                HStack(spacing: 16) {
                    ForEach(0..<2) { _ in
                        VStack(alignment: .leading, spacing: 8) {
                            Text("نوع النوبة: نوبة جزئية")
                            Text("مدة النوبة: ٢:٣٣")
                            Text("تاريخ النوبة: ٦/٦/١٤٤٦")
                        }
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer().frame(height: 20)
            
            // نبضات القلب
            VStack(alignment: .leading, spacing: 10) {
                Text("نبضات القلب")
                    .font(.headline)
                    .foregroundColor(.white)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.1))
                        .frame(height: 100)
                    
                    Image(systemName: "heart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // التاب بار
            HStack {
                VStack {
                    Image(systemName: "house.fill")
                    Text("الرئيسية")
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                
                VStack {
                    Image(systemName: "chart.bar.fill")
                    Text("التقرير")
                }
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity)
            }
            .padding()
            .background(Color.white.opacity(0.1))
        }
        .background(Color("B1")) // خلفية الصفحة
        .edgesIgnoringSafeArea(.all) // تغطية الشاشة بالكامل
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
           
    }
}

