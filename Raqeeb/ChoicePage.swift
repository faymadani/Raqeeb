//
//  SwiftUIView.swift
//  rageep
//
//  Created by Dana Alghamdi on 12/06/1446 AH.
//

import SwiftUI

struct ChoicePage: View {
    @AppStorage("hasSeenSwiftUIView") var hasSeenSwiftUIView: Bool = false

    var body: some View {
        NavigationView {  // Add NavigationView here as well
            ZStack {
                Color.bg
                    .ignoresSafeArea()

                VStack {
                    Text("لتعيين التطبيق أخبرنا بدورك")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.baigee)
                        .offset(y: 300)
                    
                    Spacer()

                    // Button to page3
                    NavigationLink(destination: page3()) {
                        ZStack {
                            Image("strt")
                            HStack {
                                Image("arrow")
                                    .padding(.trailing, 14)
                                Text("أنا اعاني من اضطرابات الصرع")
                                    .foregroundColor(.bg)
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    .padding(.bottom, 10)

                    // Button to page3 when "أنا جهة اتصال طوارئ لشخص ما" is clicked
                    NavigationLink(destination: page3()) {
                        ZStack {
                            Image("strt")
                            HStack {
                                Image("arrow")
                                    .padding(.trailing, 1)
                                Text("أنا جهة اتصال طوارئ لشخص ما")
                                    .foregroundColor(.bg)
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    .padding(.bottom, 30)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ChoicePage()
}
