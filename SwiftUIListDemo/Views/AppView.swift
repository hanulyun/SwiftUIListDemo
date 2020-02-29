//
//  AppView.swift
//  SwiftUIListDemo
//
//  Created by Hanul Yun on 2020/02/29.
//  Copyright © 2020 Hanul Yun. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("메뉴")
            }
            
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("주문표")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order: Order = Order()
    
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
