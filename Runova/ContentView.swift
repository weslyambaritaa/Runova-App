import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var userData = UserData()
    
    @Query var userDataArray: [UserData] = []
    @Query var appStateArray: [AppState] = []
    @Query var historyListArray: [HistoryComponent] = []
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        
        if userDataArray.count == 0 {
            NavigationStack {
                ZStack{
                    Color.black.opacity(1)
                            .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 20) {
                        
                        ZStack {
                            Divider()
                                .frame(width: 200, height:10)
                                .background(Color.abuBG)
                            
                            HStack{
                                Spacer()
                                Text("1")
                                    .font(.title2)
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(
                                        Circle()
                                            .fill(Color.hijauTerang)
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
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(
                                        Circle()
                                            .fill(Color.abuBG)
                                            .stroke(Color.abuBG)
                                        
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
                        
                        Spacer()
                        
                        VStack (spacing: 10){
                            
                            Text("BIODATA")
                                .font(.title)
                                .bold()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                            Text("Name")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.white)
                            
                            TextField("Enter your name", text: $userData.name)
                                .padding()
                                .background(Color.abuBG)
                                .cornerRadius(10)
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .foregroundColor(.white)
                        }
                        
                        VStack (spacing: 10){
                            Text("Age")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.white)
                            TextField("Enter your age", value: $userData.age, formatter: NumberFormatter())
//                                .keyboardType(.numberPad)
                                .padding()
                                .background(Color.abuBG)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        VStack{
                            Text("Select Gender")
                                .bold()
                                .font(.title2)
                                .foregroundColor(.white)
                            HStack(spacing: 80) {
                                // Male Button
                                Button(action: {
                                    userData.selectedGender = "Male"
                                }) {
                                    VStack {
                                        Image(systemName: "person.fill")
                                            .resizable()
                                            .frame(width: userData.selectedGender == "Male" ? 70 : 60,
                                                   height: userData.selectedGender == "Male" ? 70 : 60)
                                            .animation(.easeInOut(duration: 0.3), value: userData.selectedGender)
                                            .foregroundColor(userData.selectedGender == "Male" ? .blue : .gray)
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 25)
                                                    .stroke(userData.selectedGender == "Male" ? .blue : .gray, lineWidth: 3)
                                                    .animation(.easeInOut(duration: 0.3), value: userData.selectedGender)
                                            )
                                        Text("Male")
                                            .font(.title3)
                                            .foregroundColor(userData.selectedGender == "Male" ? .blue : .gray)
                                            .animation(.easeInOut(duration: 0.3), value: userData.selectedGender)
                                    }
                                }
                                
                                Button(action: {
                                    userData.selectedGender = "Female"
                                }) {
                                    VStack {
                                        Image(systemName: "person.fill")
                                            .resizable()
                                            .frame(width: userData.selectedGender == "Female" ? 70 : 60,
                                                   height: userData.selectedGender == "Female" ? 70 : 60)
                                            .animation(.easeInOut(duration: 0.3), value: userData.selectedGender)
                                            .foregroundColor(userData.selectedGender == "Female" ? .pink : .gray)
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 25)
                                                    .stroke(userData.selectedGender == "Female" ? .pink : .gray, lineWidth: 3)
                                                    .animation(.easeInOut(duration: 0.3), value: userData.selectedGender)
                                                
                                            )
                                        Text("Female")
                                            .font(.title3)
                                            .foregroundColor(userData.selectedGender == "Female" ? .pink : .gray)
                                            .animation(.easeInOut(duration: 0.3), value: userData.selectedGender)
                                    }
                                }
                            }
                        }
                        Spacer()
                        Spacer()
                        
                        NavigationLink(destination: InputDataView(userData: $userData)) {
                            Text("Continue")
                                .frame(maxWidth: .infinity)
                                .font(.title)
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.hijauTerang)
                                .clipShape(Rectangle())
                                .cornerRadius(20)
                                .padding(.horizontal)
                        }.disabled(userData.name.isEmpty || userData.age == 0 || userData.selectedGender.isEmpty)
                    } .padding(.horizontal, 20)
                    
                    Spacer()
                    
                }
            }
            .onAppear {
                // new app state
                let newAppState = AppState()
                modelContext.insert(newAppState)
                
//                let newHistoryComponent = HistoryComponent(session: 1, week: 2, time: "Wesly")
//                modelContext.insert(newHistoryComponent)
            }
        } else {
            CustomTabView(userData: userDataArray.first!, appState: appStateArray.first!)
        }
        
    }
}


#Preview {
    ContentView()
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            ContentView()
//        }
//    }
//}
