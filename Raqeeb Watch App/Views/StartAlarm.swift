//
//  StartAlarm.swift
//  Raqeeb Watch App
//
//  Created by Raghad on 12/12/2024.
//

import SwiftUI

struct StartAlarm: View {
    
    @State private var showCancel: Bool = false
    @State private var didCancel: Bool = false
    
    @State private var showText = true
    @State private var navigateToNextPage = false
    
    var body: some View {
        Color("Background")
            .ignoresSafeArea()
            .overlay {
                VStack {
                    heartRateView()
                    if showCancel {
                        slideToCancelButton()
                            .OnSwipeSuccess {
                                self.didCancel = true
                                self.showCancel = false
                            }
                            .transition(AnyTransition.scale.animation(Animation.spring(response: 0.3,dampingFraction: 0.5)))
                    }
                    
                    if didCancel {
                        if showText {
                            VStack{
                                ZStack{
                                    Circle()
                                        .stroke(Color.white, lineWidth: 3)
                                        .frame(width: 50, height: 50)
                                    Image(systemName: "checkmark")
                                        .foregroundColor(Color.white)
                                        .font(.largeTitle)
                                }.padding(.bottom, 16)
                                Text("تم إلغاء التنبية")
                            }
                                .transition(AnyTransition.scale.animation(Animation.spring(response: 0.5,dampingFraction: 0.5)))
                                .onAppear() {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        showText = false
                                        navigateToNextPage = true
                                    }
                                }
                        }else {
                            mainView() .transition(AnyTransition.scale.animation(Animation.spring(response: 0.3,dampingFraction: 0.8)))
                        }
                        //FOR TESTING
                        //                           .onAppear() {
                        //                               DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        //                                   self.didCancel = false
                        //                                   self.showCancel = true
                        //
                        //                               }
                        //                           }
                        
                    }
                }
                .padding()
                .onAppear {
                    self.showCancel = true
                    
                }
//                .navigationDestination(isPresented: $navigateToNextPage) {
//                    mainView()
//                }
            }
    }
}

#Preview {
    StartAlarm()
}
