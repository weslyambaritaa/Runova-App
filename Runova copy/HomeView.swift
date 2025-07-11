import SwiftUI

struct ProgressBar: View {
    @Binding var progress: Float
    var color: Color = Color.blue
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.20)
                .foregroundColor(Color.gray)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 2.0))
        }
    }
}

struct HomeView: View {
    let daysOfWeek = ["S", "M", "T", "W", "T", "F", "S"]
    let currentDay: Int = Calendar.current.component(.weekday, from: Date())
    var userData: UserData
    
    @State private var sessionCompeleted = 0
    @State private var dinamisCalories = 0
    @State private var dinamisWeight = 0
    @State private var calorieBurned = 0
    @State private var minuteRunning = 0
    @State private var week = 1
    @State private var sesi = 1
    @State private var sesiSum = 0
    @State var progressValue: Float = 0.0
    
    var body: some View {
        
        
        //        ZStack {
        //            Color.gray.opacity(0.1)
        //                .edgesIgnoringSafeArea(.all)
        
        
        VStack (alignment: .leading, spacing: 30){
            Spacer()
            VStack (alignment: .leading){
                Text("Hello, \(userData.name)")
                    .bold()
                    .font(.title)
                Text("\(userData.name)")
                    .fontWeight(.regular)
                    .font(.title3)
                
            }.padding(.leading)
            
            
            Spacer()
            
            VStack{
                HStack {
                    ForEach(0..<daysOfWeek.count, id: \.self) { index in
                        VStack {
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(currentDay == (index + 1) % 7 ? .blue : .abuGelap)
                            Text(daysOfWeek[index])
                                .font(.title3)
                                .bold()
                                .foregroundColor(currentDay == (index + 1) % 7 ? .blue : .abuGelap)
                        }
                        if index < daysOfWeek.count - 1 {
                            Spacer()
                        }
                    }
                }.padding(.horizontal)
                
                HStack (spacing:15){
                    VStack (spacing: 15){
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .frame(width: 150, height: 100)
                                .shadow(color: Color.gray.opacity(0.7), radius: 5, x: 0, y: 0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white, lineWidth: 3)
                                )
                            
                            HStack{
                                Image(systemName: "figure.run")
                                    .resizable()
                                    .frame(width: 30, height: 40)
                                VStack(alignment: .leading){
                                    Text("\(userData.runningTime) minutes")
                                        .bold()
                                    Text("\(userData.runningType)")
                                        .font(.caption)
                                        .foregroundColor(.abuGelap)
                                    
                                    Text("\(userData.sessionsPerWeek) session per week")
                                        .font(.caption)
                                        .foregroundColor(.abuGelap)
                                }
                            }
                        }
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .frame(width: 150, height: 100)
                                .shadow(color: Color.gray.opacity(0.7), radius: 5, x: 0, y: 0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white, lineWidth: 3)
                                )
                            
                            HStack{
                                Image(systemName: "fork.knife")
                                    .resizable()
                                    .frame(width: 30, height: 40)
                                VStack(alignment: .leading){
                                    Text("\(kalkulasiCalorie(selectedGender: userData.selectedGender, startingWeight: userData.startingWeight, height: userData.height, age: userData.age, activityKoef: userData.activityKoef)) cal")
                                        .bold()
                                    Text("Recommended ")
                                        .font(.caption)
                                        .foregroundColor(.abuGelap)
                                    
                                    Text("Calorie Intake")
                                        .font(.caption)
                                        .foregroundColor(.abuGelap)
                                }
                            }
                        }
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .frame(width: 200, height: 215)
                            .shadow(color: Color.gray.opacity(0.7), radius: 5, x: 0, y: 0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white, lineWidth: 3)
                            )
                        VStack{
                            HStack{
                                Image(systemName: "chart.bar.fill")
                                    .resizable()
                                    .frame(width: 30, height: 40)
                                
                                VStack(alignment: .leading){
                                    Text("\(kalkulasiEC (startingWeight: userData.startingWeight , MET: userData.MET , runningTime: userData.runningTime, targetWeight: userData.targetWeight)) Sessions")
                                        .bold()
                                        .font(.title2)
                                    Text("\(sessionCompeleted)/\(kalkulasiEC (startingWeight: userData.startingWeight , MET: userData.MET , runningTime: userData.runningTime, targetWeight: userData.targetWeight)) Session Completed ")
                                        .font(.caption)
                                        .foregroundColor(.abuGelap)
                                    
                                    
                                }
                                
                            }
                            VStack{
                                ProgressBar(progress: self.$progressValue)
                                    .frame(width: 50, height: 50)
                                    .padding(20.0).onAppear(){
                                        self.progressValue = 0.0
                                    }
                            }
                        }
                    }
                }
            }
            //                Spacer()
            
            ZStack{
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .frame(width: 365, height: 130)
                            .shadow(color: Color.gray.opacity(0.7), radius: 5, x: 0, y: 0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white, lineWidth: 3)
                            )
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text("\(calorieBurned) cal burned")
                                    .font(.body)
                                Text("Session \(sesi)")
                                    .bold()
                                    .font(.title2)
                                Text("Week \(week)")
                                    .bold()
                                    .font(.title2)
                                Text("\(minuteRunning) minute running")
                                    .font(.body)
                            }.padding()
                            
                            Divider()
                                .frame(height: 110)
                                .background(Color.gray)
                                .padding(.horizontal)
                            
                            
                            Spacer()
                            
                            Button(action: {
                                
                                if (sessionCompeleted < (kalkulasiCalorie(selectedGender: userData.selectedGender, startingWeight: userData.startingWeight, height: userData.height, age: userData.age, activityKoef: userData.activityKoef))) {
                                    sessionCompeleted += 1
                                } else if ((sessionCompeleted == (kalkulasiCalorie(selectedGender: userData.selectedGender, startingWeight: userData.startingWeight, height: userData.height, age: userData.age, activityKoef: userData.activityKoef))) || (sessionCompeleted < (kalkulasiCalorie(selectedGender: userData.selectedGender, startingWeight: userData.startingWeight, height: userData.height, age: userData.age, activityKoef: userData.activityKoef)))) {
                                    
                                }
                                
                                
                                if (sesi < userData.sessionsPerWeek && (sesiSum < kalkulasiCalorie(selectedGender: userData.selectedGender, startingWeight: userData.startingWeight, height: userData.height, age: userData.age, activityKoef: userData.activityKoef))) {
                                    sesi += 1
                                    sesiSum += 1
                                } else if (sesi == userData.sessionsPerWeek && (sesiSum < kalkulasiCalorie(selectedGender: userData.selectedGender, startingWeight: userData.startingWeight, height: userData.height, age: userData.age, activityKoef: userData.activityKoef))) {
                                    sesi = 1
                                    week += 1
                                    sesiSum += 1
                                }
                                
                                
//                                if (week < userData.)
//                                week += 1
                                
                                if (sessionCompeleted == 1){
                                    dinamisWeight += Int(userData.startingWeight)
                                } else {
                                    dinamisWeight -= weightPerSesi(startingWeight: Double(dinamisWeight) , MET: userData.MET , runningTime: userData.runningTime)
                                }
                                
                                dinamisCalories = kalkulasiCalorie(selectedGender: userData.selectedGender, startingWeight: Double(dinamisWeight), height: userData.height, age: userData.age, activityKoef: userData.activityKoef)
                                
                                calorieBurned += caloriePerSesi(startingWeight: Double(dinamisWeight) , MET: userData.MET , runningTime: userData.runningTime)
                                
                                minuteRunning += userData.runningTime
                                
//                                minuteRunning = minuteRunning + userData.runningTime
//                                sessionCompeleted += 1
                                
                                if (progressValue < 1.0) {
                                    self.progressValue += Float((sessionCompeleted/(kalkulasiEC (startingWeight: userData.startingWeight , MET: userData.MET , runningTime: userData.runningTime, targetWeight: userData.targetWeight))))
                                } else {
                                    
                                }
                                
                            }) {
                                Text("DONE")
                                    .frame(width:80, height: 50)
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .clipShape(Rectangle())
                                    .cornerRadius(20)
                                    .padding(.horizontal)
                            }
                            Spacer()
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            
            //        }
            Button(action: {
                
            }) {
                HStack {
                    Spacer()
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(width: 100, height: 40)
                            .shadow(color: Color.gray.opacity(0.7), radius: 5, x: 0, y: 0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 3)
                            )
                        Label{
                            Text("History")
                                .font(.headline)
                                .foregroundColor(.black)
                        } icon: {
                            Image(systemName: "calendar")
                                .foregroundColor(.black)
                        } .padding(.horizontal, 20)
                    }
                }.padding(.horizontal, 10)
            }
            Spacer()
            Spacer()
            
        }
        
    }
    
    func kalkulasiEC (startingWeight: Double , MET: Double , runningTime: Int, targetWeight: Double) -> Int {
        var sesi = 0
        let kaloriPerSesi = (MET * 16.96 * startingWeight * Double(runningTime)) / 200.0
        let penguranganBB = kaloriPerSesi / 7700
        
        var beratSekarang = startingWeight
        
        while (beratSekarang > targetWeight) {
            sesi += 1
            beratSekarang -= penguranganBB;
            }
        
        return sesi
        
    }
    
    func weightPerSesi (startingWeight: Double , MET: Double , runningTime: Int) -> Int {
        let kaloriPerSesi = (MET * 16.96 * startingWeight * Double(runningTime)) / 200.0
        let penguranganBB = kaloriPerSesi / 7700
        
        return Int(penguranganBB)
    }
    
    func caloriePerSesi(startingWeight: Double , MET: Double , runningTime: Int) -> Int {
        let kaloriPerSesi = (MET * 16.96 * startingWeight * Double(runningTime)) / 200.0
        
        return Int(kaloriPerSesi)
    }
    
    func kalkulasiCalorie(selectedGender: String, startingWeight: Double, height: Int, age: Int, activityKoef: Double) -> Int {
        let amb: Double

        if selectedGender == "Male" {
            amb = 66 + (13.7 * startingWeight) + (5.0 * Double(height)) - (6.8 * Double(age))
        } else {
            amb = 655 + (9.6 * startingWeight) + (1.8 * Double(height)) - (4.7 * Double(age))
        }

        let totalCalories = amb * activityKoef
        return Int(totalCalories)
    }

    
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(userData: UserData())
//    }
//}
//
