//
//  UserDetailView.swift
//  Friendable
//
//  Created by Thaddeus Dronski on 1/9/23.
//

import SwiftUI

struct UserDetailView: View {
    let user: CachedUser
    var body: some View {
        VStack {
             Section {
                 Text(user.wrappedName)
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
                        Text(user.wrappedEmail)
                    }
                    HStack {
                        Text("Address: ")
                        Text(user.wrappedAddress)
                    }
                }
            }
            Section {
                List {
                    ForEach(user.friendsArray, id: \.id) { friend in
                        Text(friend.wrappedName)
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

//struct UserDetailView_Previews: PreviewProvider {
//    static var user = User.example
//    static var previews: some View {
//        UserDetailView(user: CachedUser)
//    }
//}
