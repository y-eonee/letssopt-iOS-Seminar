//
//  ContentView.swift
//  SOPT-38-SwiftUI
//
//  Created by 이나연 on 5/13/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.black)
            HStack {
                Text("이거슨 스페이서")
                    .foregroundStyle(.white)
                    .border(.cyan)
                
                Spacer()
                
                Text("아무말.....흠냐냐 ... ")
                    .foregroundStyle(.white)
                    .border(.yellow)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
