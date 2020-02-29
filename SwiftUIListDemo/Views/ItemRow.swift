//
//  ItemRow.swift
//  SwiftUIListDemo
//
//  Created by Hanul Yun on 2020/02/29.
//  Copyright © 2020 Hanul Yun. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "V": .green]
    var item: MenuItem
    
    var body: some View {
        NavigationLink(destination: ItemDetailView(item: item)) {
            HStack {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.yellow, lineWidth:4))
                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                        .foregroundColor(.black)
                    Text("$\(item.price)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .layoutPriority(1) // text tail 부분 ... 되는거 방지하기 위해 우선순위 1로 지정
                
                Spacer()
                
                ForEach(item.restrictions, id: \.self) { restric in
                    Text(restric)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restric, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
