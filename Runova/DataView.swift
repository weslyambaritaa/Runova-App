import SwiftUI
import SwiftData

struct DataView: View {
    @State var height: String = ""
    @State var startingWeight: String = ""
    @State var targetWeight: String = ""
    var userData: UserData
    var appState: AppState
    //var historyComponent: HistoryComponent
    
    @State private var showAlert = false
    @State private var navigate = false
    
    @Query var historyListArray: [HistoryComponent] = []
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            
            ZStack{
                
                Color.black.opacity(1)
                    .edgesIgnoringSafeArea(.all)
                
                VStack (alignment: .leading, spacing: 10){
                    Text("Your Data")
                        .padding(.horizontal,5)
                        .padding(.vertical,10)
                        .bold()
                        .font(.title)
                        .foregroundColor(.white)
                    
                    VStack(spacing: 25){
                        HStack(spacing:25){
                            CustomCard(
                                label: "Name",
                                content: "\(userData.name)",
                                backgroundColor: .abuBG,
                                textColor: .hijauTerang
                            )
                            
                            CustomCard(
                                label: "Age",
                                content: "\(userData.age)",
                                backgroundColor: .abuBG,
                                textColor: .hijauTerang
                            )
                            
                        }
                        
                        HStack(spacing:25){
                            CustomCard(
                                label: "Gender",
                                content: "\(userData.selectedGender)",
                                backgroundColor: .abuBG,
                                textColor: .hijauTerang
                            )
                            
                            CustomCard(
                                label: "Height",
                                content: "\(userData.height)",
                                backgroundColor: .abuBG,
                                textColor: .hijauTerang
                            )
                        }
                        
                        HStack(spacing:25){
                            CustomCard(
                                label: "Starting Weight",
                                content: "\(userData.startingWeight)",
                                backgroundColor: .abuBG,
                                textColor: .hijauTerang
                            )
                            
                            CustomCard(
                                label: "Goal Weight",
                                content: "\(userData.targetWeight)",
                                backgroundColor: .abuBG,
                                textColor: .hijauTerang
                            )
                        }
                        
                        HStack(spacing:25){
                            CustomCard(
                                label: "Running Time",
                                content: "\(userData.runningTime)",
                                backgroundColor: .abuBG,
                                textColor: .hijauTerang
                            )
                            
                            CustomCard(
                                label: "Avaibale Session",
                                content: "\(userData.sessionsPerWeek)",
                                backgroundColor: .abuBG,
                                textColor: .hijauTerang
                            )
                        }
                        
                        HStack(spacing:25){
                            CustomCard(
                                label: "Running Category",
                                content: "\(userData.runningType)",
                                backgroundColor: .abuBG,
                                textColor: .hijauTerang
                            )
                            
                            CustomCard(
                                label: "Activity Category",
                                content: "\(userData.activityCategory)",
                                backgroundColor: .abuBG,
                                textColor: .hijauTerang
                            )
                        }
                        Spacer()
                        HStack{
                            
                            
                            Spacer()
                            //                    CustomCard2(
                            //                        content: "New Program",
                            //                        backgroundColor: .blue,
                            //                        textColor: .white
                            //                    )
                            
                            // 🆕 Tombol New Program
                            Button(action: {
                                showAlert = true
                            }) {
                                Text("Edit Program")
                                    .frame(maxWidth: .infinity)
                                    .font(.title)
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color.hijauTerang)
                                    .clipShape(Rectangle())
                                    .cornerRadius(20)
                                    .padding(.horizontal)
                                    .bold()
                            }
                            
                            // 🆕 NavigationLink dengan state
                            NavigationLink(
                                destination: ContentView(),
                                isActive: $navigate
                            ) {
                                EmptyView()
                            }
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .padding()
                .alert("Do You Want to Make a New Session?", isPresented: $showAlert) {
                    Button("Yes", role: .destructive) {
                        navigate = true
//                        UserData()
                        modelContext.delete(userData)
                        modelContext.delete(appState)
                        for item in historyListArray {
                          modelContext.delete(item)
                            }
                        
                    }
                    Button("No", role: .cancel) {
                        
                    }
                } message: {
                    Text("Your progress will not be saved.")
                }
            }
        }
    }
}
//
//struct DataView_Previews: PreviewProvider {
//    static var previews: some View {
//        DataView(userData: UserData())
//    }
//}
