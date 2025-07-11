import SwiftUI

struct TampilanAwal: View {
    var body: some View {
        NavigationStack { // Bungkus dengan NavigationView
            ZStack {
                Color.black.ignoresSafeArea() // Latar belakang hitam
                
                VStack(spacing: 25) {
                    Spacer()
                    
                    // Logo di atas
                    Image("logo3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)

                    
                    Text("Welcome to Runova")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    
                    // LIST FITUR
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // 1. Activity
                        HStack(alignment: .top, spacing: 15) {
                            ZStack {
                                Circle()
                                    .fill(Color.hijauTerang)
                                    .frame(width: 40, height: 40)
                                Image(systemName: "figure.run")
                                    .foregroundColor(.black)
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Track Activity")
                                    .bold()
                                    .foregroundColor(.white)
                                Text("Monitor your runs and progress easily.")
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                            }
                        }
                        
                        // 2. Calories
                        HStack(alignment: .top, spacing: 15) {
                            ZStack {
                                Circle()
                                    .fill(Color.hijauTerang)
                                    .frame(width: 40, height: 40)
                                Image(systemName: "fork.knife")
                                    .foregroundColor(.black)
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Calories Guide")
                                    .bold()
                                    .foregroundColor(.white)
                                Text("Get daily calorie recommendations.")
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                            }
                        }
                        
                        // 3. Programs
                        HStack(alignment: .top, spacing: 15) {
                            ZStack {
                                Circle()
                                    .fill(Color.hijauTerang)
                                    .frame(width: 40, height: 40)
                                Image(systemName: "square.grid.2x2")
                                    .foregroundColor(.black)
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Custom Plans")
                                    .bold()
                                    .foregroundColor(.white)
                                Text("Access dynamic training programs.")
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                            }
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                    
                    // Tombol Continue
                    NavigationLink(destination: ContentView()) {
                        Text("Continue")
                            .frame(maxWidth: .infinity)
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.hijauTerang)
                            .cornerRadius(20)
                            .padding(.horizontal)
                    }
                }
                .navigationBarHidden(true) // Sembunyikan navigation bar
            }
        }
    }
}

#Preview {
    TampilanAwal() // Tidak perlu parameter destination
}
