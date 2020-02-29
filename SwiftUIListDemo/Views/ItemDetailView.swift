//
//  ItemDetailView.swift
//  SwiftUIListDemo
//
//  Created by Hanul Yun on 2020/02/29.
//  Copyright © 2020 Hanul Yun. All rights reserved.
//

import SwiftUI

struct ItemDetailView: View {
    @EnvironmentObject var order: Order
    @Environment(\.presentationMode) var presentation // 뒤로가기
    var item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .frame(minWidth: 0) // 이거 없으면 양 옆 밖으로 튀어나감
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            
            Button("주문하기") {
                self.order.add(item: self.item)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.presentation.wrappedValue.dismiss()
                }
            }.font(.headline)
            
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static let order: Order = Order()
    
    static var previews: some View {
        NavigationView { // 넘어온 View여서 따로 NavigationView를 지정해줘야 함.
            ItemDetailView(item: MenuItem.example).environmentObject(order)
            // environmentObject 안해주면 preview에서 크래시 발생
        }
    }
}
