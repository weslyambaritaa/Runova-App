//
//  UserActivityCategory.swift
//  Runova
//
//  Created by Foundation-026 on 25/06/25.
//

import SwiftUI

struct UserActivityCategory: View {
    @Binding var userData: UserData
    
    var body: some View {
        ScrollView{
            VStack {
                Spacer()
                ZStack {
                    Divider()
                        .frame(width: 210, height: 1)
                        .background(Color.black)
                    
                    HStack{
                        Spacer()
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
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                Circle()
                                    .fill(Color.blue)
                                
                            )
                        Spacer()
                        Spacer()
                        
                    }
                }
                Spacer()
                
                VStack(spacing: 10){
                    
                    Text("ACTIVITY INFORMATION")
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity)
                    
                    Text("Activity Category")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .trailing, spacing: 20) {
                        Button(action: {
                            userData.activityCategory = "Rest"
                            if(userData.selectedGender == "Male") {
                                userData.activityKoef = 1.0
                            } else {
                                userData.activityKoef = 1.0
                            }
                        }) {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .frame(width: 350, height: 140)
                                .overlay(
                                    VStack(alignment: .leading, spacing: 5) { // Rata kiri dengan .leading
                                        Text("Rest")
                                            .bold()
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity, alignment: .leading) // Teks judul rata kiri
                                        
                                        Text("Sleep, rest, or recline.")
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity, alignment: .leading) // Deskripsi rata kiri
                                            .padding(.top, 2)
                                    }
                                        .padding()
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(userData.activityCategory == "Rest" ? .blue : .gray, lineWidth: 3)
                                )
                                .offset(y: userData.activityCategory == "Rest" ? -0.1 : 0)
                                .scaleEffect(userData.activityCategory == "Rest" ? 1.01 : 1.0)
                                .animation(.easeInOut(duration: 0.3), value: userData.activityCategory)
                        }
                        
                        
                        Button(action: {
                            userData.activityCategory = "VeryLightActivity"
                            if(userData.selectedGender == "Male") {
                                userData.activityKoef = 1.3
                            } else {
                                userData.activityKoef = 1.3
                            }
                        }) {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .frame(width: 350, height: 140)
                                .overlay(
                                    VStack(alignment: .leading, spacing: 5) { // Rata kiri dengan .leading
                                        Text("Very Light Activity")
                                            .bold()
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity, alignment: .leading) // Teks judul rata kiri
                                        
                                        Text("Sitting and standing, painting, driving a car, laboratory work, typing, sweeping, ironing, cooking, playing cards, and playing musical instruments.")
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity, alignment: .leading) // Deskripsi rata kiri
                                            .padding(.top, 2)
                                    }
                                        .padding()
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(userData.activityCategory == "VeryLightActivity" ? .blue : .gray, lineWidth: 3)
                                )
                                .offset(y: userData.activityCategory == "VeryLightActivity" ? -0.1 : 0)
                                .scaleEffect(userData.activityCategory == "VeryLightActivity" ? 1.01 : 1.0)
                                .animation(.easeInOut(duration: 0.3), value: userData.activityCategory)
                        }
                        
                        
                        Button(action: {
                            userData.activityCategory = "LightActivity"
                            if(userData.selectedGender == "Male") {
                                userData.activityKoef = 1.65
                            } else {
                                userData.activityKoef = 1.55
                            }
                        }) {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .frame(width: 350, height: 140)
                                .overlay(
                                    VStack(alignment: .leading, spacing: 5) { // Rata kiri dengan .leading
                                        Text("Light Activity")
                                            .bold()
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity, alignment: .leading) // Teks judul rata kiri
                                        
                                        Text("Walking at a speed of 2.5–3 mph, working in a workshop, restaurant-related tasks, house cleaning, childcare, golf, fishing, and table tennis.")
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity, alignment: .leading) // Deskripsi rata kiri
                                            .padding(.top, 2)
                                    }
                                        .padding()
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(userData.activityCategory == "LightActivity" ? .blue : .gray, lineWidth: 3)
                                )
                                .offset(y: userData.activityCategory == "LightActivity" ? -0.1 : 0)
                                .scaleEffect(userData.activityCategory == "LightActivity" ? 1.01 : 1.0)
                                .animation(.easeInOut(duration: 0.3), value: userData.activityCategory)
                        }
                        
                        
                        Button(action: {
                            userData.activityCategory = "ModerateActivity"
                            if(userData.selectedGender == "Male") {
                                userData.activityKoef = 1.76
                            } else {
                                userData.activityKoef = 1.7
                            }
                        }) {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .frame(width: 350, height: 140)
                                .overlay(
                                    VStack(alignment: .leading, spacing: 5) { // Rata kiri dengan .leading
                                        Text("Moderate Activity")
                                            .bold()
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity, alignment: .leading) // Teks judul rata kiri
                                        
                                        Text("Walking at a speed of 3.5–4 mph, pulling weeds and hoeing, loud crying, cycling, skiing, tennis, and dancing.")
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity, alignment: .leading) // Deskripsi rata kiri
                                            .padding(.top, 2)
                                    }
                                        .padding()
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(userData.activityCategory == "ModerateActivity" ? .blue : .gray, lineWidth: 3)
                                )
                                .offset(y: userData.activityCategory == "ModerateActivity" ? -0.1 : 0)
                                .scaleEffect(userData.activityCategory == "ModerateActivity" ? 1.01 : 1.0)
                                .animation(.easeInOut(duration: 0.3), value: userData.activityCategory)
                        }
                        
                        
                        Button(action: {
                            userData.activityCategory = "IntenseActivity"
                            if(userData.selectedGender == "Male") {
                                userData.activityKoef = 2.1
                            } else {
                                userData.activityKoef = 2.0
                            }
                        }) {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .frame(width: 350, height: 140)
                                .overlay(
                                    VStack(alignment: .leading, spacing: 5) { // Rata kiri dengan .leading
                                        Text("Intense Activity")
                                            .bold()
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity, alignment: .leading) // Teks judul rata kiri
                                        
                                        Text("Hiking uphill, cutting down trees, digging soil, basketball, rock climbing, and football (soccer).")
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity, alignment: .leading) // Deskripsi rata kiri
                                            .padding(.top, 2)
                                    }
                                        .padding()
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(userData.activityCategory == "IntenseActivity" ? .blue : .gray, lineWidth: 3)
                                )
                                .offset(y: userData.activityCategory == "IntenseActivity" ? -0.1 : 0)
                                .scaleEffect(userData.activityCategory == "IntenseActivity" ? 1.01 : 1.0)
                                .animation(.easeInOut(duration: 0.3), value: userData.activityCategory)
                        }
                        
                        NavigationLink(destination: HomeView(userData: userData)) {
                            Text("Calculate Session")
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
                }.padding(.horizontal, 30)
                Spacer()
            }
        }
    }
}

struct UserActivityCategory_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserActivityCategory(userData: .constant(UserData()))
        }
    }
}
