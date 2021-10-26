import SwiftUI

struct SplashScreenView: View {
    // MARK: - PROPERTIES
    
    @State var startAnimation: Bool = false
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            Color("Primary")
            
            Group {
                SplashShape()
                    .trim(from: 0, to: startAnimation ? 1 : 0)
                    .stroke(Color.accentColor, style: StrokeStyle(lineWidth: 20, lineCap: .square, lineJoin: .round))
                }
                TriangleMask()
                    .trim(from: 0, to: startAnimation ? 1 : 0)
                    .fill(Color.accentColor)
            
            VStack(alignment: .trailing) {
                Text("Periscope Media")
                    .foregroundColor(Color.white)
                    .textCase(.uppercase)
                    .font(.title.bold())
                    .opacity(startAnimation ? 1 : 0)
                    .animation(.easeInOut)

                Text("Personal Planner")
                    .foregroundColor(Color.white)
                    .textCase(.uppercase)
                    .font(.callout)
                    .opacity(startAnimation ? 1 : 0)
                    .animation(.easeInOut)
                } //VSTACK
            .frame(maxHeight: 290, alignment: .bottom)

        } // ZSTACK
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                withAnimation(.spring().delay(0.15)) {
                    startAnimation.toggle()
                }
               
            }
        }
    }
}

struct SplashShape: Shape {
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            
            let mid = rect.width / 2
            let height = rect.height
            
            path.move(to: CGPoint(x: mid - 40, y: height / 2))
            path.addLine(to: CGPoint(x: mid - 40, y: height / 2 - 100))
            path.addArc(center: CGPoint(x: mid, y: height / 2 - 100 ), radius: 40, startAngle: .init(degrees: 180), endAngle: .zero, clockwise: false)
            path.addArc(center: CGPoint(x: mid, y: height / 2 - 100 ), radius: 40, startAngle: .init(degrees: 0), endAngle: .init(degrees: 90), clockwise: false)
            
            path.move(to: CGPoint(x: mid - 80, y: height / 2 + 40))
            path.addLine(to: CGPoint(x: mid - 80, y: height / 2 - 100))
            path.addArc(center: CGPoint(x: mid, y: height / 2 - 100 ), radius: 80, startAngle: .init(degrees: 180), endAngle: .zero, clockwise: false)
            path.addArc(center: CGPoint(x: mid, y: height / 2 - 100 ), radius: 80, startAngle: .init(degrees: 0), endAngle: .init(degrees: 90), clockwise: false)
        }
    }
}

struct TriangleMask: Shape {
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            
            let mid = rect.width / 2
            let height = rect.height
            
            path.move(to: CGPoint(x: mid - 30, y: height / 2 + 10))
            path.addLine(to: CGPoint(x: mid - 50, y: height / 2 + 10))
            path.addLine(to: CGPoint(x: mid - 50, y: height / 2 + 30))
            path.addLine(to: CGPoint(x: mid - 30, y: height / 2 + 10))
            
            path.move(to: CGPoint(x: mid - 70, y: height / 2 + 50))
            path.addLine(to: CGPoint(x: mid - 90, y: height / 2 + 50))
            path.addLine(to: CGPoint(x: mid - 90, y: height / 2 + 70))
            path.addLine(to: CGPoint(x: mid - 70, y: height / 2 + 50))
        }
    }
}

// MARK: - PREVIEW
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
