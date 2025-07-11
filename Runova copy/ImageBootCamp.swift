import SwiftUI

struct ImageBootCamp: View {
    var body: some View {
        VStack {
            // Gambar di atas
            Image("logo2")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .clipShape(Circle())

            Spacer()
        }
    }
}

struct ImageBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ImageBootCamp()
    }
}

