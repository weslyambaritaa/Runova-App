import SwiftUI
import SwiftData

struct HistoryView: View {
    var historyList: [HistoryComponent] // ✅ Pakai data parent
    
    var body: some View {
        ZStack {
            Color.black.opacity(1)
                .edgesIgnoringSafeArea(.all)
            
            NavigationView {
                VStack(spacing: 0) {
                    // 🔽 Panah kecil di atas
                    Capsule()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 40, height: 5)
                        .padding(.top, 10)
                    
                    ScrollView {
                        VStack(spacing: 15) {
                            // ✅ Sort: week desc → session desc
                            ForEach(historyList.sorted(by: {
                                if $0.week != $1.week {
                                    return $0.week > $1.week // Week terbaru dulu
                                } else {
                                    return $0.session > $1.session // Session terbaru dulu
                                }
                            })) { item in
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text("Session \(item.session)")
                                                .font(.headline)
                                                .foregroundColor(.hijauTerang)
                                            
                                            Text("Week \(item.week)")
                                                .font(.subheadline)
                                                .foregroundColor(.white)
                                        }
                                        Spacer()
                                        Text(item.time)
                                            .font(.caption)
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding()
                                .background(Color.abuBG)
                                .cornerRadius(12)
                                .shadow(radius: 2)
                            }
                        }
                        .padding()
                    }
                    .navigationTitle("History")
                    .toolbarColorScheme(.dark, for: .navigationBar)
                }
            }
        }
    }
}
