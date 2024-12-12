//
//  slideToCancelButton.swift
//  Raqeeb Watch App
//
//  Created by Raghad on 12/12/2024.
//

import SwiftUI


    struct DraggingComponent: View {
        
      @Binding var isLocked: Bool
        let isLoading: Bool
      let maxWidth: CGFloat
      private let minWidth = CGFloat(50)
      @State private var width = CGFloat(50)
        
      var body: some View {
        RoundedRectangle(cornerRadius: 16)
              .fill(Color.background)
              .opacity(width / maxWidth)
              .frame(width: width)
              .overlay(
                             Button(action: { }) {
                                 ZStack {
                                      image(name: "lock", isShown: isLocked)
                                     progressView(isShown: isLoading)
                                      image(name: "lock.open", isShown: !isLocked)
                                  }.animation(.easeIn(duration: 0.35).delay(0.55), value: !isLocked && !isLoading)
                              }
                              .buttonStyle(BaseButtonStyle())
                              .disabled(!isLocked),
                              alignment: .trailing
                        )
              .gesture(
        DragGesture()
              .onChanged { value in
                  if value.translation.width > 0 {
                      width = min(max(value.translation.width + minWidth, minWidth), maxWidth)
                  }
            }
            .onChanged {_ in
            guard isLocked else { return }
                //
          }
          .onEnded { value in
            guard isLocked else { return }
            if width < maxWidth {
                width = minWidth
//                        UINotificationFeedbackGenerator().notificationOccurred(.warning)
            } else {
//                        UINotificationFeedbackGenerator().notificationOccurred(.success)
                withAnimation(.spring().delay(0.5)) {
                  isLocked = false
                }
            }
        }
          )
              .simultaneousGesture(
                      DragGesture()
                    )
          .animation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 0), value: width)
          .frame(width: width)
      }
        private func progressView(isShown: Bool) -> some View {
            ProgressView()
              .progressViewStyle(.circular)
              .tint(.white)
              .opacity(isShown ? 1 : 0)
              .scaleEffect(isShown ? 1 : 0.01)
          }
        
        private func image(name: String, isShown: Bool) -> some View {
            Image(systemName: name)
              .font(.system(size: 20, weight: .regular, design: .rounded))
              .foregroundColor(Color.red)
              .frame(width: 42, height: 42)
              .background(RoundedRectangle(cornerRadius: 14).fill(.white))
              .padding(4)
              .opacity(isShown ? 1 : 0)
              .scaleEffect(isShown ? 1 : 0.01)
          }

    }

struct BaseButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .opacity(configuration.isPressed ? 0.9 : 1)
            .animation(.default, value: configuration.isPressed)
    }

}

struct UnlockButton: View {

  @State private var isLocked = true
  @State private var isLoading = false
  
  var body: some View {
    GeometryReader { geometry in
        ZStack(alignment: .leading) {
            BackgroundComponent()
            DraggingComponent(isLocked: $isLocked, isLoading: isLoading ,maxWidth: geometry.size.width)
        
       // DraggingComponent(isLocked: $isLocked, isLoading: isLoading, maxWidth: geometry.size.width)
      }
    }
    .frame(height: 50)
    .padding()
    .onChange(of: isLocked) { isLocked in
      guard !isLocked else { return }
      simulateRequest()
    }
  }
  private func simulateRequest() {
    isLoading = true

    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
      isLoading = false
    }
  }
}

struct BackgroundComponent: View {
    //@State private var hueRotation = false
    var body: some View {
        ZStack(alignment: .leading)  {
            RoundedRectangle(cornerRadius: 16)
                .fill(
            LinearGradient(
                colors: [Color.green.opacity(0.6), Color.gray.opacity(0.6)],
                      startPoint: .leading,
                      endPoint: .trailing
                    )
                  )
                  //.hueRotation(.degrees(hueRotation ? 20 : -20))
            Text("اسحب للإلغاء")
                .font(.footnote)
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
        }.onAppear {
            withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
           //   hueRotation.toggle()
            }
          }
    }

}




#Preview {
    UnlockButton()
}
