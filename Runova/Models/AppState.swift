import Foundation
import SwiftData

@Model
class AppState: Identifiable{
    var id: String
    var sessionCompleted: Int
    var dinamisCalories: Int
    var dinamisWeight: Double
    var calorieBurned: Int
    var minuteRunning: Int
    var week: Int
    var sesi: Int
    var sesiSum: Int
    var progressValue: Float
    var checklist: [Bool]
//    var sudahMunculSekali: Bool //perubahan
    
    init(sessionCompleted: Int = 0, dinamisCalories: Int = 0, dinamisWeight: Double = 0.0,
         calorieBurned: Int = 0, minuteRunning: Int = 0, week: Int = 1,
         sesi: Int = 1, sesiSum: Int = 0, progressValue: Float = 0.0,
         checklist: [Bool] = Array(repeating: false, count: 7), sudahMunculSekali: Bool = false) {
        self.id = UUID().uuidString
        self.sessionCompleted = sessionCompleted
        self.dinamisCalories = dinamisCalories
        self.dinamisWeight = dinamisWeight
        self.calorieBurned = calorieBurned
        self.minuteRunning = minuteRunning
        self.week = week
        self.sesi = sesi
        self.sesiSum = sesiSum
        self.progressValue = progressValue
        self.checklist = checklist
//        self.sudahMunculSekali = sudahMunculSekali //perubahan
    }
}
