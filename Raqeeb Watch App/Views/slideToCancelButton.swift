//
//  slideToCancelButton2.swift
//  Raqeeb Watch App
//
//  Created by Raghad on 12/12/2024.
//

import SwiftUI


extension Comparable{
    func clamp<T: Comparable>(lower: T, _ upper: T) -> T {
        return min(max(self as! T, lower), upper)
    }
}

extension CGSize {
    static var inactiveThumbSize: CGSize {
        return CGSize(width: 45, height: 45)
    }
    static var activeThumbSize: CGSize {
        return CGSize(width: 45, height: 45)
    }
    static var trackSize: CGSize {
        return CGSize(width: 170, height: 45)
    }
}

extension slideToCancelButton {
    func OnSwipeSuccess(_ action: @escaping () -> Void) -> Self {
        var this = self
        this.actionSuccess = action
        return this
        
    }
}

struct slideToCancelButton: View {
    
    // to animate the thumb size when user starts dragging (swipe)
    @State private var thumbSize: CGSize = CGSize.inactiveThumbSize
    
    // to track of the dragging value
    @State private var dragOffset: CGSize = .zero
    
    // track when enough was swiped
    @State private var isEnough: Bool = false
    
    //actions
    private var actionSuccess: (() -> Void )?
    
    //for the background
    @State private var hueRotation = false

    //the track doesn't change size
    let trackSize = CGSize.trackSize
    
    var body: some View{
        ZStack {
            //Background with hue rotation
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        colors: [Color.lightPurple , Color.gray.opacity(0.6)],
                      startPoint: .leading,
                      endPoint: .trailing
                    )
                ).hueRotation(.degrees(hueRotation ? 20 : -20))
                .frame(width: 170, height: 45)
                .shadow(color: .pink, radius: 0, x: 0, y: 0)
                .shadow(color: .black, radius: 1, x: 0, y: 0)
              

            //text
            Text("اسحب للإلغاء")
                .font(.footnote)
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.leading,40)
                .opacity(Double(1 - ((self.dragOffset.width*2)/self.trackSize.width)))
            
            //thumb
            
            ZStack {
                Capsule()
                    .fill(Color.white)
                    .frame(width: 55, height: 45)
                   
                Image(systemName: "arrow.right")
                    .foregroundStyle(Color.background)
                
            }.offset(x: getDragOffset(), y: 0)
          
            //to make it very smooooth
                .animation(Animation.spring(response: 0.3, dampingFraction: 0.8))
            
                .gesture(
                    DragGesture()
                        .onChanged({value in self.handleDragChanged(value)})
                        .onEnded { _ in self.handleDragEnded()}
                )
        }.frame(maxWidth: .infinity, maxHeight: 45)
    }
    
    //Haptic feedback -> for better UX
    private func indicateCanLiftFinger() -> Void {
        let _: Void = WKInterfaceDevice.current().play(.click)
    }
    
//    private func indicateSwipeWasSuccessful() -> Void {
//        let generator = UINotificationFeedbackGenerator()
//        generator.notificationOccurred(.success)
//    }
    
    
    
    //Helpers
    private func getDragOffset() -> CGFloat {     //.offset(x: -(trackSize.width / 2  - thumbSize.width / 2 - (dragOffset.width)), y: 0 )
        
        //should not be able to drag outside of the track area
        let clampedDragOffsetX = dragOffset.width.clamp(lower: 0, trackSize.width - thumbSize.width)
        return -(trackSize.width/2 - thumbSize.width/2 - (clampedDragOffsetX))
    }
    
    //Gesture Handler
    private func handleDragChanged(_ value: DragGesture.Value) -> Void {
        self.dragOffset = value.translation
        let dragWidth = value.translation.width
        let targetDragWidth = self.trackSize.width - (self.thumbSize.width*2)
        let wasInitiated = dragWidth > 2
        let didReachTarget = dragWidth > targetDragWidth
        self.thumbSize = wasInitiated ? CGSize.activeThumbSize : CGSize.inactiveThumbSize
        
        if didReachTarget {
            //only trigger once
            if !self.isEnough {
                self.indicateCanLiftFinger()
            }
            self.isEnough = true
        }else{
            //reset, do no indication here
            self.isEnough = false
        }
    }
    
    private func handleDragEnded() -> Void {
        //if enough was dragged, complate swipe
        if self.isEnough {
            self.dragOffset = CGSize(width: self.trackSize.width - self.thumbSize.width, height: 0)
            
            // the outside world should be able to know
            if nil != self.actionSuccess {
               // self.indicateSwipeWasSuccessful()
                
                //wait and give enough time for animation to finish
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    self.actionSuccess!()
                }
            }
            
        }else {
            self.dragOffset = .zero
            self.thumbSize = CGSize.inactiveThumbSize
        }
    }
}
#Preview {
    slideToCancelButton()
}
