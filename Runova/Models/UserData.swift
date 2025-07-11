import SwiftUI
import SwiftData

@Model
class UserData {
    var name: String = ""
    var age: Int = 0
    var selectedGender: String = ""
    var height: Int = 0
    var startingWeight: Double = 0.0
    var targetWeight: Double = 0.0
    var runningTime: Int = 0
    var sessionsPerWeek: Int = 0
    var runningType: String = ""
    var activityCategory: String = ""
    var MET: Double = 0.0
    var activityKoef: Double = 0.0
    
    init(name: String = "", age: Int = 0, selectedGender: String = "", height: Int = 0, startingWeight: Double = 0.0, targetWeight: Double = 0.0, runningTime: Int = 0, sessionsPerWeek: Int = 0, runningType: String = "", activityCategory: String = "", MET: Double = 0.0, activityKoef: Double = 0.0) {
        self.name = name
        self.age = age
        self.selectedGender = selectedGender
        self.height = height
        self.startingWeight = startingWeight
        self.targetWeight = targetWeight
        self.runningTime = runningTime
        self.sessionsPerWeek = sessionsPerWeek
        self.runningType = runningType
        self.activityCategory = activityCategory
        self.MET = MET
        self.activityKoef = activityKoef
    }
}
