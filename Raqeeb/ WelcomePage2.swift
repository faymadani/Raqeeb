//
//  ContentView.swift
//  rageep
//
//  Created by Dana Alghamdi on 12/06/1446 AH.
//
import SwiftUI

struct WelcomePage2: View {
    var body: some View {
        NavigationView {  // Wrap the entire view in a NavigationView
            ZStack {
                Color.bg
                    .ignoresSafeArea()

                VStack {
                    Image("bubbl")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .offset(y: 50)

                    Text("Welcome to Raqeep")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.baigee)
                        .padding(.top, 90)

                    Text("Welcome to Raqeeb. If you or a family member are experiencing epilepsy or other seizure disorders, this app will help you monitor your condition more effectively.")
                        .foregroundColor(.baigee)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .padding(.top, 10.0)
                    
                    Spacer()

                    // NavigationLink to SwiftUIView
                    NavigationLink(destination: ChoicePage()) {
                        ZStack {
                            Image("strt")
                            Text("Start")
                                .foregroundColor(.bg)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        }
                    }
                    .navigationBarBackButtonHidden(true)
                    .padding(.top, 100)

                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    WelcomePage2()
}
