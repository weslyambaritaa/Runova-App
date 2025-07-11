import SwiftUI

struct InputDataView: View {
    @Binding var userData: UserData

    var body: some View {
        ZStack{
            Color.black.opacity(1)
                    .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                VStack{
                    ZStack{
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
                                .foregroundColor(.black)
                                .padding()
                                .background(
                                    Circle()
                                        .fill(Color.hijauTerang)
                                    
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
                    } .padding(20)
                }
                
                
                Text("BODY INFORMATION")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                
                VStack (alignment: .trailing, spacing: 10){
                    Text("Height")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.white)
                    TextField("Height (cm)", value: $userData.height, formatter: NumberFormatter())

                        .padding()
                        .background(Color.abuBG)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                
                VStack (alignment: .trailing, spacing: 10){
                    Text("Starting Weight (kg)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.white)
                    TextField("Starting Weight (kg)", value: $userData.startingWeight, formatter: NumberFormatter())

                        .padding()
                        .background(Color.abuBG)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                
                VStack (alignment: .trailing, spacing: 10){
                    Text("Goal Weight (kg)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.white)
                    TextField("Target Weight (kg)", value: $userData.targetWeight, formatter: NumberFormatter())

                        .padding()
                        .background(Color.abuBG)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                NavigationLink(destination: RunningType(userData: $userData)) {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.hijauTerang)
                        .clipShape(Rectangle())
                        .cornerRadius(20)
                        .padding(.horizontal)
                }.disabled(userData.height == 0 || userData.startingWeight == 0 || userData.targetWeight == 0)
            }
            .padding()
            
            
            
        }
    }
}
//
//struct InputDataView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            InputDataView(userData: .constant(UserData()))
//        }
//    }
//}

