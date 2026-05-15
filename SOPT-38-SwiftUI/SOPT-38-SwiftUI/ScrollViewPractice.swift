//
//  ScrollViewPractice.swift
//  SOPT-38-SwiftUI
//
//  Created by 이나연 on 5/13/26.
//

import SwiftUI

struct ScrollViewPractice: View {
    var body: some View {
        //        ScrollView() {
        //            VStack {
        //                ForEach(1..<100) {
        //                    Text("Item \($0)")
        //                        .font(.title)
        //                }
        //            }
        //
        //            .frame(maxWidth: .infinity)
        //        }
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<10) {
                    Text("숫자 \($0)")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .background(Color.yellow)
                }
            }
            .frame(maxHeight: .infinity)
        }
    }
}

