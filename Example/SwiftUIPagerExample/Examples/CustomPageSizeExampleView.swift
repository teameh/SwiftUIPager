//
//  VerticalExampleView.swift
//  SwiftUIPagerExample
//
//  Created by Tieme van Veen on 29/05/2020.
//  Copyright © 2020 Fernando Moya de Rivas. All rights reserved.
//

import SwiftUI

struct CustomPageSizeExampleView: View {
    @State var page: Int = 0

    @State var pagerHeight: CGFloat = 200
    @State var pageWidth: CGFloat = -100
    @State var pageHeight: CGFloat = -20

    var data = Array(0..<10)

    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 10) {
                Text(String(format: "pager height: %.0f", self.pagerHeight)).bold()
                Slider(value: self.$pagerHeight, in: 0...400).padding()

                Text(String(format: "page width: %.0f", self.pageWidth)).bold()
                Slider(value: self.$pageWidth, in: -200...0).padding()

                Text(String(format: "page height: %.0f", self.pageHeight)).bold()
                Slider(value: self.$pageHeight, in: -200...0).padding()

                Pager(page: self.$page,
                      data: self.data,
                      id: \.self) {
                        self.pageView($0)
                }
                .itemSpacing(10)
                .customPageSize { pagerSize in
                    CGSize(
                        width: pagerSize.width + self.pageWidth,
                        height: pagerSize.height + self.pageHeight
                    )
                }
                .frame(height: self.pagerHeight)
                .background(Color.gray.opacity(0.2))
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
