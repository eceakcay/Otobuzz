//
//  profile.swift
//  OtobuzzApp
//
//  Created by Mine Kırmacı on 29.03.2025.
//

import SwiftUI

struct Profile: View {
    @State private var selectedTab: String = "Profilim"
    var body: some View {
        CustomNavigationBar(selectedTab: $selectedTab)
    }
}

#Preview {
    Profile()
}
