//
//  ChatView.swift
//  SOPT-38-SwiftUI
//
//  Created by 이나연 on 5/13/26.
//

import SwiftUI

struct ChatView: View {
    let chatList: ChatListModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 40, height: 40)
                
                Image(chatList.profileImage)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Text(chatList.name)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(chatList.location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Text(chatList.lastMessage)
                    .font(.subheadline)
            }
            
            Spacer()
            
            Image(chatList.productImage)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(4)
        }
        .padding(.horizontal)
        .padding(.vertical, 16)
        .background(Color.white)
    }
}
