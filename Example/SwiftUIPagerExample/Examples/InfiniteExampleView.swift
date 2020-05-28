//
//  InfiniteExampleView.swift
//  SwiftUIPagerExample
//
//  Created by Fernando Moya de Rivas on 02/03/2020.
//  Copyright © 2020 Fernando Moya de Rivas. All rights reserved.
//

import SwiftUI

struct InfiniteExampleView: View {

    @State var page1: Int = 0
    @State var data1 = Array(0..<5)
    @State var aspect: CGFloat = 0
    @State var height: CGFloat = 150

    var data2 = Array(0..<5)

    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 10) {
                Spacer()

                Text(String(format: "itemAspectRatio: %.2f", self.aspect)).bold()
                Slider(value: self.$aspect, in: 0.0...3).padding()

                Text(String(format: "height: %.0f", self.height)).bold()
                Slider(value: self.$height, in: 0...400).padding()

                Spacer()

                Pager(page: self.$page1,
                      data: self.data1,
                      id: \.self) {
                        self.pageView($0)
                    }
                    .itemSpacing(10)
                    .itemAspectRatio(self.aspect, alignment: .center)
                    .padding(20)
                    .background(Color.gray.opacity(0.2))
                    .frame(height: self.height)

                Spacer()
            }
        }
    }

    func pageView(_ page: Int) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.yellow)
            Text("Page: \(page)")
                .bold()
        }
        .cornerRadius(5)
        .shadow(radius: 5)
    }

}
