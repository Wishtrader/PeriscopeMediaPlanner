import SwiftUI

struct SplashScreenView: View {
    // MARK: - PROPERTIES
    
    @State var startAnimation: Bool = false
    @State var endAnimation: Bool = false
    @State var titleAnimation: Bool = false
    @State var subtitleAnimation: Bool = false
    
    // MARK: - Body
    var body: some View {
      VStack {
        ZStack {
            Color("Primary")
            
            Group {
                SplashShape()
                    .trim(from: 0, to: startAnimation ? 1 : 0)
                    .stroke(Color.accentColor, style: StrokeStyle(lineWidth: 20, lineCap: .square, lineJoin: .round))
                
                TriangleShape()
                    .trim(from: 0, to: startAnimation ? 1 : 0)
                    .fill(Color.accentColor)
                } // End TopBar
            .scaleEffect(endAnimation ? 0.1 : 1.0)
            .offset(y: endAnimation ? 20 : 0)
            .offset(x: endAnimation ? -150 : 0) // MARK: Fix it!
        
            
            VStack(alignment: .trailing) {
                Text("Periscope Planner")
                  .foregroundColor(Color.white)
                  .textCase(.uppercase)
                  .font(.subheadline.bold())
                  .opacity(endAnimation ? 1 : 0)
                  .offset(x: -100, y: 46)
                Text("Periscope Media")
                  .foregroundColor(Color.white)
                  .textCase(.uppercase)
                  .font(.title.bold())
                  .opacity(titleAnimation ? 1 : 0)
                  .offset(x: titleAnimation ? 0 : -50, y: 120)
                  .scaleEffect(endAnimation ? 0 : 1)

                Text("Personal Planner")
                  .foregroundColor(Color.white)
                  .textCase(.uppercase)
                  .font(.callout)
                  .opacity(subtitleAnimation ? 1 : 0)
                  .offset(y: subtitleAnimation ? 120 : 80)
                  .scaleEffect(endAnimation ? 0 : 1)
                } //VSTACK
        } // ZSTACK
        .frame(height: endAnimation ? 80 : nil)
    } // VSTACK
      .frame(maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                withAnimation(.spring().delay(0.2)) {
                    startAnimation.toggle()
                }
                
                withAnimation(.spring().delay(0.6)) {
                    titleAnimation.toggle()
                }
               
                withAnimation(Animation.easeIn(duration: 0.4).delay(1.0)) {
                    subtitleAnimation.toggle()
                }
                
                withAnimation(.spring().delay(2.0)) {
                    endAnimation.toggle()
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

struct TriangleShape: Shape {
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
