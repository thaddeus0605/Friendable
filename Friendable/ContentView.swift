//
//  ContentView.swift
//  Friendable
//
//  Created by Thaddeus Dronski on 1/9/23.
//

import SwiftUI

struct ContentView: View {
    
  
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var users: FetchedResults<CachedUser>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    NavigationLink {
                        UserDetailView(user: user)
                    } label: {
                        HStack {
                            Text(user.wrappedName)
                            Circle()
                                .foregroundColor(user.isActive ? .green : .red)
                                .frame(width: 10)
                        }
                    }
                }
            }
            .navigationTitle("Friendable")
        }
        .task {
            await loadData()
        }
    }
    func loadData() async {
        if users.isEmpty {
            guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                print("Invalid URL")
                return
            }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let decoder = JSONDecoder()
                let users = try decoder.decode([User].self, from: data)
                await MainActor.run {
                    updateCache(with: users)
                }
            } catch {
                print("Invalid data")
            }
        }
    }
    
    func updateCache(with downloadedUsers: [User]) {
        for user in downloadedUsers {
             let cachedUser = CachedUser(context: moc)
            
            cachedUser.id = user.id
            cachedUser.isActive = user.isActive
            cachedUser.name = user.name
            cachedUser.age = Int16(user.age)
            cachedUser.company = user.company
            cachedUser.email = user.email
            cachedUser.address = user.address
            cachedUser.about = user.about
            cachedUser.tags = user.tags.joined(separator: ",")
            
            for friend in user.friends {
                let cachedFriend = CachedFriend(context: moc)
                cachedFriend.id = friend.id
                cachedFriend.name = friend.name
                cachedUser.addToFriends(cachedFriend)
            }
        }
        try? moc.save()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
