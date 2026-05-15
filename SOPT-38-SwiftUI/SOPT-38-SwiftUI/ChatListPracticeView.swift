//
//  ChatListPracticeView.swift
//  SOPT-38-SwiftUI
//
//  Created by 이나연 on 5/16/26.
//

import SwiftUI

struct ChatUser: Identifiable {
    let id = UUID()
    let name: String
    let message: String
}

struct ChatListPracticeView: View {
    let users: [ChatUser] = [
        ChatUser(name: "나연", message: "듀듀듀"),
        ChatUser(name: "소은", message: "영화 보러 가자요"),
        ChatUser(name: "승희", message: "버블티머글사람"),
        ChatUser(name: "교은", message: "내일 점심 어때요?"),
        ChatUser(name: "지인", message: "내 말 들리나요")
    ]

    @State private var activeStates: [Bool] = [true, false, false, true, false]

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(users.indices, id: \.self) { index in
                        StoryItemView(
                            user: users[index],
                            isActive: $activeStates[index]
                        )
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
            .padding(10)

            List {
                ForEach(users.indices, id: \.self) { index in
                    ChatRowView(
                        user: users[index],
                        isActive: $activeStates[index]
                    )
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

struct StoryItemView: View {
    let user: ChatUser
    @Binding var isActive: Bool

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(isActive ? .blue : .gray)

            Circle()
                .fill(isActive ? Color.green : Color.gray)
                .frame(width: 15, height: 15)
                .offset(x: 2, y: 2)
        }
        .onTapGesture {
            isActive.toggle()
        }
    }
}

struct ChatRowView: View {
    let user: ChatUser
    @Binding var isActive: Bool

    var body: some View {
        HStack(spacing: 12) {
            ZStack(alignment: .bottomTrailing) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(isActive ? .blue : .gray)

                Circle()
                    .fill(isActive ? Color.green : Color.gray)
                    .frame(width: 12, height: 12)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(user.name)
                    .font(.headline)
                Text(user.message)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Text("오전 9:41")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
    }
}

