import SwiftUI

struct DataView: View {
    @State var height: String = ""
    @State var startingWeight: String = ""
    @State var targetWeight: String = ""
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            Text("INFORMATION")
                .padding(.horizontal,10)
                .padding(.vertical,10)
                .bold()
                .font(.title)
                
            VStack(spacing: 25){
                HStack(spacing:25){
                        CustomCard(
                                       label: "Name",
                                       content: "Wesly Ambarita",
                                       backgroundColor: .abuMuda,
                                       textColor: .black
                                   )
                        
                        CustomCard(
                                       label: "Age",
                                       content: "19",
                                       backgroundColor: .abuMuda,
                                       textColor: .black
                                   )
                  
                }
                
                HStack(spacing:25){
                    CustomCard(
                                   label: "Gender",
                                   content: "Male",
                                   backgroundColor: .white,
                                   textColor: .black
                               )
                    
                    CustomCard(
                                   label: "Height",
                                   content: "178",
                                   backgroundColor: .white,
                                   textColor: .black
                               )
                }
                
                HStack(spacing:25){
                    CustomCard(
                                   label: "Starting Weight",
                                   content: "80",
                                   backgroundColor: .white,
                                   textColor: .black
                               )
                    
                    CustomCard(
                                   label: "Goal Weight",
                                   content: "75",
                                   backgroundColor: .white,
                                   textColor: .black
                               )
                }
            }
            
            VStack(alignment: .leading, spacing: 5) { // Mengurangi jarak antar elemen
                Text("Gender")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 5)
                
                TextField("Male", text: $height)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
            }
            
            VStack(alignment: .leading, spacing: 5) { // Mengurangi jarak antar elemen
                Text("Age")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 5)
                
                TextField("18", text: $height)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
            }
            
            VStack(alignment: .leading, spacing: 5) { // Mengurangi jarak antar elemen
                Text("Height")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 5)
                
                TextField("178", text: $height)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
            }
            
            VStack(alignment: .leading, spacing: 5) { // Mengurangi jarak antar elemen
                Text("Height")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 5)
                
                TextField("Enter your height", text: $height)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
            }
            
            
            Spacer()
        }
        .padding()
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
