import SwiftUI

struct CustomTabView: View {
    var userData: UserData
    var appState: AppState
    //var historyComponent: HistoryComponent
    @State private var selectedTab = 0 // State untuk melacak tab yang aktif
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(userData: userData, appState: appState)
                .tabItem {
                    Label("Dashboard", systemImage: "chart.pie.fill")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .tag(0)
            
            DataView(userData: userData, appState: appState)
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                        .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                }
                .tag(1)
        }
        .tint(Color.cyan) // Warna untuk tab yang aktif
        .onAppear() {
            // Atur warna tab yang tidak aktif
            UITabBar.appearance().unselectedItemTintColor = UIColor(Color.abuBG)
        }
    }
}


//#Preview {
//    CustomTabView(userData: UserData())
//}
