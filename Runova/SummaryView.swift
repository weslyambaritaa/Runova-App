import SwiftUI

struct SummaryView: View {
    var userData: UserData

    var body: some View {
        VStack(spacing: 20) {
            Text("Summary").font(.largeTitle).bold()

            Group {
                Text("Name: \(userData.name)")
                Text("Age: \(userData.age)")
                Text("Gender: \(userData.selectedGender)")
            }

            Group {
                Text("Height: \(userData.height) cm")
                Text("Starting Weight: \(userData.startingWeight) kg")
                Text("Target Weight: \(userData.targetWeight) kg")
            }

            Group {
                Text("Running Time: \(userData.runningTime) minutes")
                Text("Sessions Per Week: \(userData.sessionsPerWeek)")
                Text("Running Type: \(userData.runningType)")
            }

            Text("Activity Category: \(userData.activityCategory)")
        }
        .padding()
    }
}
