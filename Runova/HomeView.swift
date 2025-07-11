import SwiftUI
import SwiftData

struct ProgressBar: View {
    @Binding var progress: Float
    var color: Color = Color.red
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.20)
                .foregroundColor(Color.red)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.red)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 1.0), value: progress)
        }
    }
}

struct HomeView: View {
    let daysOfWeek = ["S", "M", "T", "W", "T", "F", "S"]
    let currentDay: Int = Calendar.current.component(.weekday, from: Date())
    var userData: UserData
    @State private var showSheet = false
    @State private var showAlert = false
    @State private var navigate = false
    @State private var historyList: [HistoryComponent] = []
    
    @Query var appStates: [AppState]
    @Environment(\.modelContext) var modelContext
    
    @Bindable var appState: AppState
    @State var progressValue: Float = 0.0
    
    var body: some View {
        ZStack {
            Color.black.opacity(1)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 30) {
                Spacer()
                VStack(alignment: .leading) {
                    Text("Hello, \(userData.name)")
                        .bold()
                        .font(.title)
                        .foregroundColor(.white)
                }
                .padding(.leading)
                
                Spacer()
                
                VStack {
                    // Calendar view
                    HStack {
                        ForEach(0..<daysOfWeek.count, id: \.self) { index in
                            VStack {
                                Image(systemName: "circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.clear)
                                    .overlay(
                                        Circle()
                                            .stroke(currentDay == ((index + 1) % 7) ? Color.cyan : Color.white, lineWidth: 3)
                                    )
                                Text(daysOfWeek[index])
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(currentDay == (index + 1) % 7 ? .cyan : .white)
                            }
                            if index < daysOfWeek.count - 1 {
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Session & calorie information
                    HStack(spacing: 15) {
                        Spacer()
                        VStack(spacing: 15) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.abuBG)
                                    .frame(width: 150, height: 100)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.abuBG, lineWidth: 2)
                                    )
                                
                                VStack(alignment: .leading) {
                                    Text("\(userData.runningTime) minutes")
                                        .bold()
                                        .foregroundColor(.white)
                                    Text("\(userData.runningType)")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .bold()
                                    Text("\(userData.sessionsPerWeek) session per week")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .bold()
                                }
                                .padding(.horizontal, 8)
                            }
                            .frame(maxWidth: .infinity, alignment: .center) // <<< memastikan lurus
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.abuBG)
                                    .frame(width: 150, height: 100)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.abuBG, lineWidth: 2)
                                    )
                                
                                HStack(alignment: .center, spacing: 8) {
                                    Image(systemName: "fork.knife")
                                        .resizable()
                                        .frame(width: 30, height: 40)
                                        .foregroundColor(.hijauTerang)
                                    
                                    VStack(alignment: .leading) {
                                        Text("\(kalkulasiCalorie(selectedGender: userData.selectedGender, startingWeight: Double(appState.dinamisWeight), height: userData.height, age: userData.age, activityKoef: userData.activityKoef)) cal")
                                        .bold()
                                        .foregroundColor(.white)
                                        Text("Recommended Calorie Intake")
                                            .font(.caption)
                                            .foregroundColor(.white)
                                            .bold()
                                    }.id(appState.dinamisWeight)
                                }
                                .padding(.horizontal, 8)
                            }
                            .frame(maxWidth: .infinity, alignment: .center) // <<< memastikan lurus
                        }
                        .frame(maxWidth: .infinity, alignment: .center) // <<< menjaga semua vertikal rapi
                        
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.abuBG)
                                .frame(width: 200, height: 215)
                            VStack {
                                HStack {
                                    Image(systemName: "chart.bar.fill")
                                        .resizable()
                                        .frame(width: 30, height: 40)
                                        .foregroundColor(.red)
                                    VStack(alignment: .leading) {
                                        Text("\(kalkulasiEC(startingWeight: userData.startingWeight, MET: userData.MET, runningTime: userData.runningTime, targetWeight: userData.targetWeight)) Sessions")
                                            .bold()
                                            .font(.title2)
                                            .foregroundColor(.white)
                                        Text("\(appState.sessionCompleted)/\(kalkulasiEC(startingWeight: userData.startingWeight, MET: userData.MET, runningTime: userData.runningTime, targetWeight: userData.targetWeight)) Completed")
                                            .font(.caption)
                                            .foregroundColor(.white)
                                    }
                                }
                                ProgressBar(progress: $appState.progressValue)
                                    .frame(width: 80, height: 80)
                                    .padding(20)
                                    .onAppear {
                                        self.progressValue = appState.progressValue
                                    }
                            }
                        }
                        Spacer()
                    }
                }
                
                // DONE Button
                ZStack {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.abuBG)
                                .frame(width: 365, height: 130)
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("\(appState.calorieBurned) cal burned")
                                        .bold()
                                        .foregroundColor(.white)
                                    Text("Session \(appState.sesi)")
                                        .bold()
                                        .font(.title2)
                                        .foregroundColor(.white)
                                    Text("Week \(appState.week)")
                                        .bold()
                                        .font(.title2)
                                        .foregroundColor(.white)
                                    Text("\(appState.minuteRunning) minute running")
                                        .bold()
                                        .foregroundColor(.white)
                                }
                                .padding()
                                
                                Divider()
                                    .frame(height: 110)
                                    .background(Color.gray)
                                    .padding(.horizontal)
                                
                                Spacer()
                                
                                Button(action: {
                                    showAlert = true
                                }) {
                                    Text("DONE")
                                        .frame(width: 100, height: 100)
                                        .bold()
                                        .foregroundColor(.hijauTerang)
                                        .background(Color.black.opacity(0.5))
                                        .clipShape(Rectangle())
                                        .cornerRadius(20)
                                }
                                .disabled(appState.sessionCompleted >= kalkulasiEC(startingWeight: userData.startingWeight, MET: userData.MET, runningTime: userData.runningTime, targetWeight: userData.targetWeight))
                                .opacity(appState.sessionCompleted >= kalkulasiEC(startingWeight: userData.startingWeight, MET: userData.MET, runningTime: userData.runningTime, targetWeight: userData.targetWeight) ? 0.5 : 1.0)
                                Spacer()
                                Spacer()
                            }
                            .alert(isPresented: $showAlert) {
                                let totalSesi = kalkulasiEC(startingWeight: userData.startingWeight, MET: userData.MET, runningTime: userData.runningTime, targetWeight: userData.targetWeight)
                                
                                if appState.sessionCompleted == totalSesi - 1 {
                                    return Alert(
                                        title: Text("Congratulations!"),
                                        message: Text("This is your final session. Completing this will finish your program."),
                                        primaryButton: .default(Text("Complete Program")) {
                                            completeSession()
                                        },
                                        secondaryButton: .cancel()
                                    )
                                } else {
                                    return Alert(
                                        title: Text("Have You Finished The Session?"),
                                        message: Text("You will go to the next session."),
                                        primaryButton: .destructive(Text("Yes")) {
                                            completeSession()
                                        },
                                        secondaryButton: .cancel()
                                    )
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                HStack{
                    Spacer()
                    // History Button
                    Button {
                        showSheet = true
                    } label: {
                        Label("History", systemImage: "calendar")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.abuBG)
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $showSheet) {
                        HistoryView(historyList: historyList)
                    }
                    
                    
                }.padding(.horizontal, 25)
                Spacer()
                Spacer()
            }
            .onAppear {
                
                if appState.dinamisWeight == 0 {
                    appState.dinamisWeight = userData.startingWeight // ✅ Set berat awal
                }
                
                if let savedState = appStates.first {
                    // Load existing state
                    appState.sessionCompleted = savedState.sessionCompleted
                    appState.progressValue = savedState.progressValue
                    appState.week = savedState.week
                    appState.sesi = savedState.sesi
                    appState.sesiSum = savedState.sesiSum
                    appState.dinamisCalories = savedState.dinamisCalories
                    appState.dinamisWeight = savedState.dinamisWeight
                    appState.minuteRunning = savedState.minuteRunning
                    appState.calorieBurned = savedState.calorieBurned
                    appState.checklist = savedState.checklist
                    
                    // Load history
                    let fetchDescriptor = FetchDescriptor<HistoryComponent>()
                    if let savedHistory = try? modelContext.fetch(fetchDescriptor) {
                        historyList = savedHistory
                    }
                } else {
                    // Create new AppState if none exists
                    let newState = AppState()
                    modelContext.insert(newState)
                    try? modelContext.save()
                    // Update properties to local state
                    appState.sessionCompleted = newState.sessionCompleted
                    appState.progressValue = newState.progressValue
                    appState.week = newState.week
                    appState.sesi = newState.sesi
                    appState.sesiSum = newState.sesiSum
                    appState.dinamisCalories = newState.dinamisCalories
                    appState.dinamisWeight = newState.dinamisWeight
                    appState.minuteRunning = newState.minuteRunning
                    appState.calorieBurned = newState.calorieBurned
                    appState.checklist = newState.checklist
                }
            }
        }
    }
    
    func kalkulasiEC(startingWeight: Double, MET: Double, runningTime: Int, targetWeight: Double) -> Int {
        var sesi = 0
        let kaloriPerSesi = (MET * 16.96 * startingWeight * Double(runningTime)) / 200.0
        let penguranganBB = kaloriPerSesi / 7700
        var beratSekarang = startingWeight
        while beratSekarang > targetWeight {
            sesi += 1
            beratSekarang -= penguranganBB
        }
        return sesi
    }
    
    func kalkulasiCalorie(selectedGender: String, startingWeight: Double, height: Int, age: Int, activityKoef: Double) -> Int {
        let amb: Double
        if selectedGender == "Male" {
            amb = 66 + (13.7 * startingWeight) + (5.0 * Double(height)) - (6.8 * Double(age))
        } else {
            amb = 655 + (9.6 * startingWeight) + (1.8 * Double(height)) - (4.7 * Double(age))
        }
        return Int(amb * activityKoef)
    }
    
    func completeSession() {
        let totalSesi = kalkulasiEC(
            startingWeight: userData.startingWeight,
            MET: userData.MET,
            runningTime: userData.runningTime,
            targetWeight: userData.targetWeight
        )
        
        if appState.sessionCompleted < totalSesi {
            // 📝 Tambahkan ke history dulu
            let currentHistory = HistoryComponent(
                session: appState.sesi,
                week: appState.week,
                time: Date().formatted(date: .abbreviated, time: .shortened)
            )
            historyList.append(currentHistory)
            modelContext.insert(currentHistory)
            
            // ✅ Hitung kalori per sesi & pengurangan berat badan
            let kaloriSesi = caloriePerSesi(
                startingWeight: Double(appState.dinamisWeight),
                MET: userData.MET,
                runningTime: userData.runningTime
            )
            let penguranganBB = Double(kaloriSesi) / 7700.0 // ✅ penurunan berat badan (kg)
            
            // ✅ Update berat badan dinamis
            appState.dinamisWeight -= penguranganBB // 🔥 berat turun
            
            // ✅ Update kalori rekomendasi (otomatis saat pakai dinamisWeight di kalkulasiCalorie())
            
            // ✅ Update ke sesi/week berikutnya
            appState.sessionCompleted += 1
            appState.sesi += 1
            appState.progressValue = Float(appState.sessionCompleted) / Float(totalSesi)
            
            if appState.sesi > userData.sessionsPerWeek {
                appState.sesi = 1
                appState.week += 1
            }
            
            appState.minuteRunning += userData.runningTime
            appState.calorieBurned += kaloriSesi // ✅ akumulasi kalori terbakar
            
            do {
                try modelContext.save()
                print("✅ AppState & berat badan berhasil disimpan")
            } catch {
                print("❌ Gagal menyimpan AppState: \(error)")
            }
        }
    }
    
    
    
    
    
    func caloriePerSesi(startingWeight: Double, MET: Double, runningTime: Int) -> Int {
        let kaloriPerSesi = (MET * 16.96 * startingWeight * Double(runningTime)) / 200.0
        return Int(kaloriPerSesi)
    }
}
