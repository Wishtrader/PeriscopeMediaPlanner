import SwiftUI

struct TaskView: View {
    var body: some View {
      HStack {
        Text("09:00")
          .font(.footnote.bold())
          .foregroundColor(Color.accentColor)
        Text("Meeting with all team members about organizing new projects")
          .padding(.leading, 8)
          .font(.footnote)
          .multilineTextAlignment(.leading)
          .lineLimit(1)
      }
      .padding()
      .frame(height: 60)
      .background(Color.white.opacity(0.1))
      .cornerRadius(10)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
      TaskView()
        .preferredColorScheme(.dark)
          .previewLayout(.sizeThatFits)
          .padding()
    }
}
