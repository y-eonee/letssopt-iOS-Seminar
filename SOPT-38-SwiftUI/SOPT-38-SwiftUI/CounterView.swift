//
//  CounterView.swift
//  SOPT-38-SwiftUI
//
//  Created by 이나연 on 5/16/26.
//

import SwiftUI

struct CounterView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("카운트: \(count)")
            Button("올리기") {
                count += 1
            }
        }
    }
}
