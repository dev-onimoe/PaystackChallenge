//
//  ContentView.swift
//  PaystackChallenge
//
//  Created by Masud Onikeku on 03/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        //Color.white.ignoresSafeArea(.all)
        NavigationView {
            if let success = viewModel.repoResponse?.successful {
                
                if success {
                    if let repos = viewModel.repoResponse?.object as? [APIRepo] {
                        List {
                            //Color.white
                            ForEach(repos, content: {repo in
                                
                                repoListView(repo: repo).background(NavigationLink("", destination: DetailScreen(repo: repo))
                                    .opacity(0)).listRowBackground(Color.clear)
                            })
                        }
                        .navigationTitle("Repositories")
                        
                        
                    }
                }else {
                    
                    VStack(spacing: 8) {
                        
                        Image(systemName: "xmark.circle.fill").frame(width: 70, height: 70).foregroundColor(.red)
                        if let msg = viewModel.repoResponse?.message {
                            
                            msg.isEmpty ? Text("There was an error") : Text(msg)
                        }
                        Button("Try again", action: {
                                
                            viewModel.getData(page: 1)
                        })
                    }
                }
                
            }else {
                Progress().onAppear {
                    viewModel.getData(page: 1)
                }
                
            }
                
        }
    }
}

struct Progress: View {
    var body: some View {
        ProgressView()
    }
}

struct repoListView: View {
    
    var repo : APIRepo
    
    var body: some View {
        
        HStack {
            
            //Spacer().frame(width: 10)
            
            AsyncImage(url: URL(string: repo.owner.avatar)) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "person")
                    .foregroundColor(.primary)
                    .frame(width: 30, height: 30)
            }.frame(width: 30, height: 30)
                .cornerRadius(15)
            
            
            
            Spacer().frame(width: 10)
            
            VStack {
                Text(repo.name)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(repo.owner.login)
                    .font(.caption2)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }.tag(10)
        }.frame(height: 50)
    }
}

#Preview {
    ContentView()
}
