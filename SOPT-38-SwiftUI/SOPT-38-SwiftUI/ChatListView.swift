//
//  ChatListView.swift
//  SOPT-38-SwiftUI
//
//  Created by 이나연 on 5/13/26.
//

import SwiftUI

struct ChatListView: View {
    let chatLists: [ChatListModel]
    
    var body: some View {
        List(chatLists) { chatList in
            ChatView(chatList: chatList)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.visible)
        }
        .listStyle(.plain)
    }
}
