import SwiftUI

struct TampilanAwal: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(spacing: 25) {
                    Spacer()
                    
                 
                    Image("logo3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)

                    
                    Text("Welcome to Runova")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                
                    VStack(alignment: .leading, spacing: 20) {
                        
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
                .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    TampilanAwal() 
}
