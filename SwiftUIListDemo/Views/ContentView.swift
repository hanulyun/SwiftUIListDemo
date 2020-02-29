//
//  ContentView.swift
//  SwiftUIListDemo
//
//  Created by Hanul Yun on 2020/02/29.
//  Copyright © 2020 Hanul Yun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let menu: [MenuSection] = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            List {
                // 메뉴 Title
                ForEach(menu) { section in
                    Section(header: Text(section.name)) { // Header
                        // Title에 해당하는 메뉴 리스트
                        ForEach(section.items) { item in // Cell
                            ItemRow(item: item)
                        }
                    }
                }
            }
            .navigationBarTitle("메뉴")
            .listStyle(GroupedListStyle()) // Header 부분 스타일 변경
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
