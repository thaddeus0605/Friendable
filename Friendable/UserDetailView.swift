//
//  UserDetailView.swift
//  Friendable
//
//  Created by Thaddeus Dronski on 1/9/23.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    var body: some View {
        VStack {
             Section {
                 Text(user.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
             }
            Section {
                VStack {
                    HStack {
                        Text(String(user.age))
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("Online Status:")
                        Circle()
                            .foregroundColor(user.isActive ? .green : .red)
                            .frame(width: 15)
                    }
                }
            }
            Section {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Contact")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.bottom)
                    }
                    HStack {
                        Text("Email: ")
                        Text(user.email)
                    }
                    HStack {
                        Text("Address: ")
                        Text(user.address)
                    }
                }
            }
            Section {
                HStack {
                    ForEach(user.tags, id: \.self) { tag in
                        Text(tag)
                    }
                }
            } header: {
                Text("Tags:")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            Section {
                List {
                    ForEach(user.friends, id: \.id) { friend in
                        Text(friend.name)
                    }
                }
                
            } header: {
                Text("Friends")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var user = User.example
    static var previews: some View {
        UserDetailView(user: user)
    }
}
