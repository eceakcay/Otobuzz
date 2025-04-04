//
//  payment_viewModel.swift
//  OtobuzzApp
//
//  Created by Mine Kırmacı on 29.03.2025.
//

import Foundation

class PaymentViewModel: ObservableObject {
    @Published var cardNumber: String = ""
    @Published var expirationDate: String = ""
    @Published var cvv: String = ""
    
    @Published var paymentAmount: String = "100 TL"
    @Published var paymentStatus: String = ""
    
    // Ödeme işlemini gerçekleştirecek fonksiyon
    func processPayment() {
        // Burada ödeme işlemleri yapılacak (örneğin, ödeme API'sine istek gönderme)
        
        // Ödeme başarılıysa
        self.paymentStatus = "Ödeme Başarılı!"
        
        // Ödeme başarısızsa
        // self.paymentStatus = "Ödeme Başarısız!"
    }
}

