//
//  DetailScreen.swift
//  PaystackChallenge
//
//  Created by Masud Onikeku on 05/07/2024.
//

import SwiftUI

struct DetailScreen: View {
    
    let repo : APIRepo
    
    var body: some View {
        //Color.white
        VStack {
            detailRepresentable(repo: repo)
            //Spacer()
        }
    }
}

struct detailRepresentable: UIViewControllerRepresentable {
    
    var repo : APIRepo
    
    typealias UIViewControllerType = DetailViewController
    
    func makeUIViewController(context: Context) -> DetailViewController {
        let vc = DetailViewController()
        vc.repo = repo
        return vc
    }
    
    func updateUIViewController(_ uiViewController: DetailViewController, context: Context) {
        //
    }
    
}

//#Preview {
    //DetailScreen()
//}
