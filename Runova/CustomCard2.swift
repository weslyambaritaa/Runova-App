import SwiftUI

struct CustomCard2: View {
    var content: String
    var backgroundColor: Color = .white
    var textColor: Color = .black

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(backgroundColor)
                .frame(width: 150, height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.abuMuda, lineWidth: 3)
                )
            
            Text(content)
                .bold()
                .foregroundColor(textColor)
                .font(.title3)
        }
    }
}
