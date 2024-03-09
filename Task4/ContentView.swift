import SwiftUI

struct ContentView: View {
    
    @State private var animate: Bool = false
    
    
    var body: some View {
        Button {
            withAnimation(.interpolatingSpring(stiffness: 170, damping: 15)) {
                animate = true
            } completion: {
                animate = false
            }
            
        } label : {
            GeometryReader { proxy in
                
                let width = proxy.size.width / 2
                let sysName = "play.fill"
                
                HStack(alignment: .center, spacing: 0) {
                    Image(systemName: sysName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: animate ? width: .zero)
                        .opacity(animate ? 1 : .zero)
                    Image(systemName: sysName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: width)
                    Image(systemName: sysName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: animate ? 0.5 : width)
                        .opacity(animate ? .zero : 1)
                }
                .frame(maxHeight: .infinity, alignment: .center)
            }
        }
        .frame(maxWidth: 100)
        .buttonStyle(BackgroundButtonStyle())
        .foregroundColor(.black)
    }
}

#Preview {
    ContentView()
}
