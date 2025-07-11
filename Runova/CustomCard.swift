import SwiftUI

struct CustomCard: View {
    var label: String
    var content: String
    var backgroundColor: Color = .abuBG
    var textColor: Color = .black

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(backgroundColor)
                .frame(width: 170, height: 80)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.abuBG, lineWidth: 3)
                )
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(label)
                        .font(.caption)
                        .foregroundColor(textColor)
                        .bold()
                    Text(content)
                        .bold()
                        .foregroundColor(.white)
                        .font(.title3)
                }
                .padding()
                Spacer()
            }
        }
    }
}
