import SwiftUI

struct ContentView: View {
    @State private var userData = UserData()
    
    var body: some View {
        
        NavigationStack {
                
                VStack(spacing: 20) {
                    
                    ZStack {
                        Divider()
                            .frame(width: 200, height: 1)
                            .background(Color.black)
                        
                        HStack{
                            Spacer()
                            Text("1")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding()
                                .background(
                                    Circle()
                                        .fill(Color.blue)
                                )
                            Spacer()
                            
                            Text("2")
                                .font(.title2)
                                .foregroundColor(.black)
                                .padding()
                                .background(
                                    Circle()
                                        .fill(Color.white)
                                        .stroke(Color.black)
                                    
                                )
                            
                            Spacer()
                            Text("3")
                                .font(.title2)
                                .foregroundColor(.black)
                                .padding()
                                .background(
                                    Circle()
                                        .fill(Color.white)
                                        .stroke(Color.black)
                                    
                                )
                            
                            Spacer()
                            Text("4")
                                .font(.title2)
                                .foregroundColor(.black)
                                .padding()
                                .background(
                                    Circle()
                                        .fill(Color.white)
                                        .stroke(Color.black)
                                    
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
                        
                        Text("Name")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("Enter your name", text: $userData.name)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                    }
                    
                    VStack (spacing: 10){
                        Text("Age")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Enter your age", value: $userData.age, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                    Spacer()
                    VStack{
                        Text("Select Gender")
                            .bold()
                            .font(.title2)
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
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Rectangle())
                            .cornerRadius(20)
                            .padding(.horizontal)
                    }/*.disabled(userData.name.isEmpty)*/
                } .padding(.horizontal, 20)
                
                Spacer()
            
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
