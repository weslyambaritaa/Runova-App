import SwiftUI

struct RunningType: View {
    @Binding var userData: UserData
    
    var body: some View {
        ZStack{
            Color.black.opacity(1)
                    .edgesIgnoringSafeArea(.all)
            VStack {
                
                ScrollView {
                    
                    VStack(spacing: 30) {
                        VStack(spacing: 10){
                            
                            ZStack {
                                Divider()
                                    .frame(width: 200, height: 10)
                                    .background(Color.abuBG)
                                
                                HStack{
                                    Spacer()
                                    Text("1")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(
                                            Circle()
                                                .fill(Color.abuBG)
                                                .stroke(Color.abuBG)
                                        )
                                    Spacer()
                                    
                                    Text("2")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(
                                            Circle()
                                                .fill(Color.abuBG)
                                                .stroke(Color.abuBG)
                                            
                                        )
                                    
                                    Spacer()
                                    Text("3")
                                        .font(.title2)
                                        .foregroundColor(.black)
                                        .padding()
                                        .background(
                                            Circle()
                                                .fill(Color.hijauTerang)
                                            
                                        )
                                    
                                    Spacer()
                                    Text("4")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(
                                            Circle()
                                                .fill(Color.abuBG)
                                                .stroke(Color.abuBG)
                                            
                                        )
                                    Spacer()
                                }
                            }
                        }
                        
                        VStack(spacing: 10){
                            
                            Text("BODY INFORMATION")
                                .font(.title)
                                .bold()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                            
                            Text("Running time (minute)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.white)
                                .bold()
                            
                            TextField("Running Time (minutes)", value: $userData.runningTime, formatter: NumberFormatter())
                                .padding()
                                .background(Color.abuBG)
                                .cornerRadius(10)
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .foregroundColor(.white)
                                .bold()
                            
                            
                            Text("Session per Week")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.white)
                                .bold()
                            
                            TextField("Sessions Per Week", value: $userData.sessionsPerWeek, formatter: NumberFormatter())
                                .padding()
                                .background(Color.abuBG)
                                .cornerRadius(10)
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .foregroundColor(.white)
                                .bold()
                        }
                        
                        VStack(spacing: 10){
                            Text("Running Pace Category")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.white)
                                .bold()
                            
                            VStack(alignment: .trailing, spacing: 20) {
                                Button(action: {
                                    userData.runningType = "Slow Jog (3-4 km/h)"
                                    userData.MET = 2.75
                                }) {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.abuBG)
                                        .frame(width: 350, height: 100)
                                        .overlay(
                                            VStack(alignment: .leading, spacing: 5) { // Rata kiri dengan .leading
                                                Text("Slow Jog (3-4 km/h)")
                                                    .bold()
                                                    .foregroundColor(.white)
                                                    .frame(maxWidth: .infinity, alignment: .leading) // Teks judul rata kiri
                                                
                                                Text("A very relaxed and easy pace, perfect for beginners or cool-downs after a workout.")
                                                    .font(.subheadline)
                                                    .bold()
                                                    .foregroundColor(.white)
                                                    .frame(maxWidth: .infinity, alignment: .leading) // Deskripsi rata kiri
                                                    .padding(.top, 2)
                                            }
                                                .padding()
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(userData.runningType == "Slow Jog (3-4 km/h)" ? .hijauTerang : .abuBG, lineWidth: 3)
                                        )
                                        .offset(y: userData.runningType == "Slow Jog (3-4 km/h)" ? -0.1 : 0)
                                        .scaleEffect(userData.runningType == "Slow Jog (3-4 km/h)" ? 1.01 : 1.0)
                                        .animation(.easeInOut(duration: 0.3), value: userData.runningType)
                                }
                                
                                
                                Button(action: {
                                    userData.runningType = "Easy Run (5-6.4 km/h)"
                                    userData.MET = 3.75
                                }) {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.abuBG)
                                        .frame(width: 350, height: 100)
                                        .overlay(
                                            VStack(alignment: .leading, spacing: 5) { // Rata kiri dengan .leading
                                                Text("Easy Run (5-6.4 km/h)")
                                                    .bold()
                                                    .foregroundColor(.white)
                                                    .frame(maxWidth: .infinity, alignment: .leading) // Teks judul rata kiri
                                                
                                                Text("A light and steady pace suitable for casual running or building a habit of regular exercise.")
                                                    .font(.subheadline)
                                                    .bold()
                                                    .foregroundColor(.white)
                                                    .frame(maxWidth: .infinity, alignment: .leading) // Deskripsi rata kiri
                                                    .padding(.top, 2)
                                            }
                                                .padding()
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(userData.runningType == "Easy Run (5-6.4 km/h)" ? .hijauTerang : .abuBG, lineWidth: 3)
                                        )
                                        .offset(y: userData.runningType == "Easy Run (5-6.4 km/h)" ? -0.1 : 0)
                                        .scaleEffect(userData.runningType == "Easy Run (5-6.4 km/h)" ? 1.01 : 1.0)
                                        .animation(.easeInOut(duration: 0.3), value: userData.runningType)
                                }
                                
                                
                                Button(action: {
                                    userData.runningType  = "Moderate Run (7-8 km/h)"
                                    userData.MET = 6
                                }) {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.abuBG)
                                        .frame(width: 350, height: 100)
                                        .overlay(
                                            VStack(alignment: .leading, spacing: 5) { // Rata kiri dengan .leading
                                                Text("Moderate Run (7-8 km/h)")
                                                    .bold()
                                                    .foregroundColor(.white)
                                                    .frame(maxWidth: .infinity, alignment: .leading) // Teks judul rata kiri
                                                
                                                Text("A balanced pace that combines comfort and effort, great for improving overall stamina.")
                                                    .font(.subheadline)
                                                    .foregroundColor(.white)
                                                    .frame(maxWidth: .infinity, alignment: .leading) // Deskripsi rata kiri
                                                    .bold()
                                                    .padding(.top, 2)
                                            }
                                                .padding()
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke( userData.runningType  == "Moderate Run (7-8 km/h)" ? .hijauTerang : .abuBG, lineWidth: 3)
                                        )
                                        .offset(y:  userData.runningType  == "Moderate Run (7-8 km/h)" ? -0.1 : 0)
                                        .scaleEffect( userData.runningType  == "Moderate Run (7-8 km/h)" ? 1.01 : 1.0)
                                        .animation(.easeInOut(duration: 0.3), value:  userData.runningType )
                                }
                                
                                
                                Button(action: {
                                    userData.runningType  = "Fast Run(8.3-9.7 km/h)"
                                    userData.MET = 9.5
                                }) {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.abuBG)
                                        .frame(width: 350, height: 100)
                                        .overlay(
                                            VStack(alignment: .leading, spacing: 5) { // Rata kiri dengan .leading
                                                Text("Fast Run(8.3-9.7 km/h)")
                                                    .bold()
                                                    .foregroundColor(.white)
                                                    .frame(maxWidth: .infinity, alignment: .leading) // Teks judul rata kiri
                                                
                                                Text("A brisk and focused pace ideal for challenging your endurance and pushing limits.")
                                                    .font(.subheadline)
                                                    .bold()
                                                    .foregroundColor(.white)
                                                    .frame(maxWidth: .infinity, alignment: .leading) // Deskripsi rata kiri
                                                    .padding(.top, 2)
                                            }
                                                .padding()
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke( userData.runningType  == "Fast Run(8.3-9.7 km/h)" ? .hijauTerang : .abuBG, lineWidth: 3)
                                        )
                                        .offset(y:  userData.runningType  == "Fast Run(8.3-9.7 km/h)" ? -0.1 : 0)
                                        .scaleEffect( userData.runningType  == "Fast Run(8.3-9.7 km/h)" ? 1.01 : 1.0)
                                        .animation(.easeInOut(duration: 0.3), value:  userData.runningType )
                                }
                                
                                
                                Button(action: {
                                    userData.runningType  = "Intense Run(10.8 km/h and above"
                                    userData.MET = 11
                                }) {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.abuBG)
                                        .frame(width: 350, height: 100)
                                        .overlay(
                                            VStack(alignment: .leading, spacing: 5) { // Rata kiri dengan .leading
                                                Text("Intense Run(10.8 km/h and above)")
                                                    .bold()
                                                    .foregroundColor(.white)
                                                    .frame(maxWidth: .infinity, alignment: .leading) // Teks judul rata kiri
                                                
                                                Text("A demanding pace for experienced runners aiming to enhance speed and cardiovascular performance.")
                                                    .font(.subheadline)
                                                    .foregroundColor(.white)
                                                    .bold()
                                                    .frame(maxWidth: .infinity, alignment: .leading) // Deskripsi rata kiri
                                                    .padding(.top, 2)
                                            }
                                                .padding()
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke( userData.runningType  == "Intense Run(10.8 km/h and above" ? .hijauTerang : .abuBG, lineWidth: 3)
                                        )
                                        .offset(y:  userData.runningType  == "Intense Run(10.8 km/h and above" ? -0.1 : 0)
                                        .scaleEffect( userData.runningType  == "Intense Run(10.8 km/h and above" ? 1.01 : 1.0)
                                        .animation(.easeInOut(duration: 0.3), value:  userData.runningType )
                                }
                                
                                NavigationLink(destination: UserActivityCategory(userData: $userData)) {
                                    Text("Continue")
                                        .frame(maxWidth: .infinity)
                                        .font(.title)
                                        .foregroundColor(.black)
                                        .padding()
                                        .background(Color.hijauTerang)
                                        .clipShape(Rectangle())
                                        .cornerRadius(20)
                                        .padding(.horizontal)
                                }.disabled(userData.runningTime == 0 || userData.sessionsPerWeek == 0 || userData.runningType.isEmpty)
                                
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                }
            }
        }
    }
}

//struct RunningType_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            RunningType(userData: .constant(UserData()))
//        }
//    }
//}
