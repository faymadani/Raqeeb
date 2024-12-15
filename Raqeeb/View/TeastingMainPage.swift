////
////  File2.swift
////  Raqeeb
////
////  Created by Fay Turad Madani on 14/06/1446 AH.
////
//
//import Foundation
//import SwiftUI
//import SwiftData
//
//struct file21View: View {
//    @Environment(UserData.self) private var userData
//
//    var body: some View {
//        VStack(spacing: 10) {
//            Spacer().frame(height: 100)
//            
//            VStack(alignment: .trailing, spacing: 8) {
//                Text("أهلا \(userData.userName)")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                
//                Text(userData.userStatus)
//                    .font(.body)
//                    .foregroundColor(.white.opacity(0.8))
//            }
//            .frame(maxWidth: .infinity, alignment: .trailing)
//            .padding(.horizontal)
//            
//            Spacer().frame(height: 10)
//            
//            VStack(alignment: .leading, spacing: 10) {
//                Text("جهات الاتصال")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                
//                HStack(spacing: 10) {
//                    Image(systemName: "phone.fill")
//                        .foregroundColor(.white)
//                        .padding(8)
//                        .background(Color.white.opacity(0.2))
//                        .clipShape(Circle())
//                    
//                    Text(userData.contactName)
//                        .font(.body)
//                        .foregroundColor(.white)
//                }
//                .padding(.vertical, 8)
//                .padding(.horizontal, 16)
//                .background(Color.white.opacity(0.1))
//                .cornerRadius(12)
//                
//            }
//            .padding(.horizontal)
//            .frame(maxWidth: .infinity, alignment: .trailing)
//            Spacer().frame(height: 10)
//            
//            VStack(alignment: .trailing, spacing: 10) {
//                Text("النوبات")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                
//                HStack(spacing: 16) {
//                    ForEach(userData.seizureDetails, id: \.self) { detail in
//                        VStack(alignment: .leading, spacing: 8) {
//                            Text(detail)
//                        }
//                        .font(.caption)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.white.opacity(0.1))
//                        .cornerRadius(12)
//                    }
//                }
//            }
//            .padding(.horizontal)
//            .frame(maxWidth: .infinity, alignment: .trailing)
//            Spacer().frame(height: 10)
//            
//            VStack(alignment: .trailing, spacing: 10) {
//                Text("نبضات القلب")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                
//                ZStack {
//                    RoundedRectangle(cornerRadius: 12)
//                        .fill(Color.white.opacity(0.1))
//                        .frame(height: 100)
//                    
//                    Image(systemName: "heart")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 50, height: 50)
//                        .foregroundColor(.white)
//                }
//            }
//            .padding(.horizontal)
//            
//            Spacer()
//            
//            HStack {
//                VStack(spacing: 4) {
//                    Image(systemName: "chart.bar.fill")
//                        .resizable()
//                        .frame(width: 24, height: 24)
//                    Text("التقرير")
//                        .font(.caption)
//                }
//                .foregroundColor(.gray)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                
//                VStack(spacing: 4) {
//                    Image(systemName: "house.fill")
//                        .resizable()
//                        .frame(width: 24, height: 24)
//                    Text("الرئيسية")
//                        .font(.caption)
//                }
//                .foregroundColor(.white)
//                .frame(maxWidth: .infinity, alignment: .trailing)
//            }
//            .padding()
//            .background(Color.white.opacity(0.1))
//        }
//        .background(Color("B1"))
//        .edgesIgnoringSafeArea(.all)
//    }
//}
//
//#Preview {
//    file21View(userData: <#T##arg#>)
//}
