import SwiftUI

struct BackgroundButtonStyle: ButtonStyle {
    
    @State private var animate = false
    let duration: TimeInterval = 0.22
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(20)
            .background {
                Circle()
                    .foregroundColor(.gray)
                    .opacity(animate ? 0.15 : 0)
            }
            .scaleEffect(animate ? 0.86 : 1)
            .animation(.easeOut(duration: duration), value: configuration.isPressed)
            .onChange(of: configuration.isPressed) {
                if configuration.isPressed {
                    withAnimation(.easeInOut(duration: duration)) {
                        animate = true
                    }
                } else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        withAnimation(.easeInOut(duration: duration)) {
                            animate = false
                        }
                    }
                }
            }
    }
}
