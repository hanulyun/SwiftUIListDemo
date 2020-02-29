//
//  OrderView.swift
//  SwiftUIListDemo
//
//  Created by Hanul Yun on 2020/02/29.
//  Copyright © 2020 Hanul Yun. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems(at:))
                }
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        if order.items.isEmpty {
                            Text("선택된 메뉴가 없어요🤖")
                        } else {
                            Text("이대로 주문하기👉")
                        }
                    }
                }.disabled(order.items.isEmpty)
            }
            .navigationBarTitle("주문표")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order: Order = Order()
    
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
