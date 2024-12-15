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
    
    @State private var alarmIsOn: Bool = false
    
    
    //timer
    @State var countdownTimer = 30
    @State var timerIsRunning = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Color("Background")
            .ignoresSafeArea()
            .overlay {
                NavigationView(){
                    VStack {
                        heartRateView()
                        Spacer()
                        
                        Text("\(countdownTimer)")
                            .font(.system(size: 40).bold())
                            .onReceive(timer) { _ in
                                if countdownTimer > 0 && timerIsRunning{
                                    countdownTimer -= 1
                                    if countdownTimer == 0 {
                                        activateAlarm()
                                        alarmIsOn = true
                                    }
                                }else{
                                    timerIsRunning = false
                                }
                            }
                        Spacer()
                        if showCancel {
                            slideToCancelButton()
                                .OnSwipeSuccess {
                                    self.didCancel = true
                                    self.showCancel = false
                                    timerIsRunning = false
                                    print(countdownTimer )
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
                }.navigationDestination(isPresented: $navigateToNextPage) {
                    mainView()
                }
                .overlay(content: {
                    if alarmIsOn {
                        AlarmIsOn()
                    }
                }
                )
            }
    }
    func activateAlarm() {
        // if countdownTimer == 0 activate the Alarm
        
        // TESTING
        print("activate Alarm")
    }
    
}

#Preview {
    StartAlarm()
}
