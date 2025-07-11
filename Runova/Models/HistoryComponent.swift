import SwiftData
import Foundation

@Model
class HistoryComponent {
    var session: Int
    var week: Int
    var time: String
    
    init(session: Int , week: Int , time: String ) {
        self.session = session
        self.week = week
        self.time = time
    }
}
