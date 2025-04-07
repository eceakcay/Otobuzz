// PaymentView.swift
import SwiftUI

struct Payment: View {
    @ObservedObject private var payment_viewModel = PaymentViewModel()
    @State private var navigateToSearch = false // Navigation için state
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    CustomAppBar()
                    
                    HStack {
                        Button(action: {
                            navigateToSearch = true // Search ekranına yönlendir
                        }) {
                            Image(systemName: "arrowshape.backward.fill")
                                .font(.title)
                                .foregroundColor(.black.opacity(0.8))
                        }
                        .padding(.leading, 10)
                        
                        Spacer()
                    }
                    
                    // NavigationLink görünmez ama çalışır
                    NavigationLink(destination: Search(), isActive: $navigateToSearch) {
                        EmptyView()
                    }
                }
                
                // Ödeme Bilgileri
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white.opacity(1))
                    .shadow(radius: 2)
                    .frame(width: 350, height: 350)
                    .padding()
                    .overlay(
                        VStack(alignment: .leading) {
                            Text("KART BİLGİLERİ")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.main)
                                .padding(.top, 20)
                                .padding(.leading, 20)
                            
                            // Kart Numarası
                            TextField("Kart Numarası", text: $payment_viewModel.cardNumber)
                                .keyboardType(.numberPad)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(radius: 2)
                                .padding(.horizontal, 20)
                            
                            HStack {
                                // Son Kullanma Tarihi
                                TextField("Son Kullanma Tarihi", text: $payment_viewModel.expirationDate)
                                    .keyboardType(.numberPad)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .shadow(radius: 2)
                                
                                // CVV
                                TextField("CVV", text: $payment_viewModel.cvv)
                                    .keyboardType(.numberPad)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .shadow(radius: 2)
                            }
                            .padding(.horizontal, 20)
                            
                            // Ödeme Tutarı
                            Text("Ödeme Tutarı: \(payment_viewModel.paymentAmount)")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.main)
                                .padding(.top, 20)
                                .padding(.leading, 20)
                            
                            // "Ödeme Yap" Butonu
                            Button(action: {
                                payment_viewModel.processPayment()
                            }) {
                                Text("Ödeme Yap")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.main)
                                    .cornerRadius(8)
                                    .shadow(radius: 5)
                            }
                            .padding(.top, 30)
                            .padding(.horizontal, 20)
                            
                            // Ödeme Durumu
                            if !payment_viewModel.paymentStatus.isEmpty {
                                Text(payment_viewModel.paymentStatus)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(payment_viewModel.paymentStatus == "Ödeme Başarılı!" ? .green : .red)
                                    .padding(.top, 20)
                            }
                        }
                    )
                
                Spacer()
            }
        }
    }
}

#Preview {
    Payment()
}
