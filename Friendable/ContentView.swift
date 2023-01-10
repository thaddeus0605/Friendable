//
//  ContentView.swift
//  Friendable
//
//  Created by Thaddeus Dronski on 1/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    NavigationLink {
                        UserDetailView(user: user)
                    } label: {
                        HStack {
                            Text(user.name)
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
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            users = try decoder.decode([User].self, from: data)
        } catch {
            print("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
