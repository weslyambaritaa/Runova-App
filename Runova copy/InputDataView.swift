import SwiftUI

struct InputDataView: View {
    // State variables untuk menyimpan input dari user
    @Binding var userData: UserData

    var body: some View {
        
            
            VStack(spacing: 20) {
                VStack{
                    ZStack{
                        
                        Divider()
                            .frame(width: 200, height: 1)
                            .background(Color.black)
                        
                        HStack{
                            Spacer()
                            Text("1")
                                .font(.title2)
                                .foregroundColor(.black)
                                .padding()
                                .background(
                                    Circle()
                                        .fill(Color.white)
                                        .stroke(Color.black)
                                )
                            Spacer()
                            
                            Text("2")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding()
                                .background(
                                    Circle()
                                        .fill(Color.blue)
                                    
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
                    } .padding(20)
                }
                
                
                Text("BODY INFORMATION")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity)
               
                VStack (alignment: .trailing, spacing: 10){
                    Text("Height")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Height (cm)", value: $userData.height, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                
                VStack (alignment: .trailing, spacing: 10){
                    Text("Starting Weight (kg)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Starting Weight (kg)", value: $userData.startingWeight, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                
                VStack (alignment: .trailing, spacing: 10){
                    Text("Goal Weight (kg)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Target Weight (kg)", value: $userData.targetWeight, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                
                Spacer()
                
                NavigationLink(destination: RunningType(userData: $userData)) {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Rectangle())
                        .cornerRadius(20)
                        .padding(.horizontal)
                }
            }
            .padding()
            
            
        
    }
}

//struct InputDataView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            InputDataView(userData: .constant(UserData()))
//        }
//    }
//}
//
