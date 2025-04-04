import SwiftUI


struct CustomNavigationBar: View {
    let title1 = "Ara"
    let title2 = "Profilim"

    @Binding var selectedTab: String
    
    var body: some View {
        VStack {
            Spacer()

            HStack(spacing: 100) {
                //Ara Butonu
                Button(action: {
                    selectedTab = title1
                }) {
                    VStack(spacing: 5) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 30))
                            .foregroundColor(selectedTab == title1 ? .main : .black)
                        Text(title1)
                            .font(.system(size: 18))
                            .foregroundColor(selectedTab == title1 ? .main : .black)
                    }
                }

                // Profil Butonu
                Button(action: {
                    selectedTab = title2
                }) {
                    VStack(spacing: 5) {
                        Image(systemName: "person")
                            .font(.system(size: 30))
                            .foregroundColor(selectedTab == title2 ? .main : .black)
                        Text(title2)
                            .font(.system(size: 18))
                            .foregroundColor(selectedTab == title2 ? .main : .black)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(Color.gray.opacity(0.2))
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    @State var selectedTab = "Ara"
    return CustomNavigationBar(selectedTab: $selectedTab)}

