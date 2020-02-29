//
//  CheckoutView.swift
//  SwiftUIListDemo
//
//  Created by Hanul Yun on 2020/02/29.
//  Copyright © 2020 Hanul Yun. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    static let paymentTypes: [String] = ["현금💰", "카드💳", "복지포인트💎"]
    static let tipAmounts: [Int] = [10, 15, 20, 25, 0]
    
    @State private var paymentType: Int = 0
    @State private var addLoyaltyDetails: Bool = false
    @State private var loyaltyNumber: String = ""
    @State private var tipAmount: Int = 1 // Tip Index
    @State private var showingPaymentAlert: Bool = false
    
    var totalPrice: Double {
        let total: Double = Double(order.total)
        let tipValue: Double = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        Form {
            Section {
                Picker("결제 수단 선택", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("멤버십 포인트 적립")
                }
                
                if addLoyaltyDetails {
                    TextField("멤버십 번호를 입력하세요.", text: $loyaltyNumber)
                }
            }
            
            Section(header: Text("팁 추가할까요?")) {
                Picker("팁 %", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("합계: $\(totalPrice, specifier: "%.2f")") // specifier 소숫점 지정
                .font(.largeTitle)
            ) {
                Button("주문 완료 💁‍♀️") {
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("주문 확인"),
                  message: Text("주문 합계는 $\(totalPrice, specifier: "%.2f") - 감사합니다."),
                  dismissButton: .default(Text("완료")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order: Order = Order()
    
    static var previews: some View {
        NavigationView {
            CheckoutView().environmentObject(order)
        }
    }
}
