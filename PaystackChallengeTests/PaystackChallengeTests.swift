//
//  PaystackChallengeTests.swift
//  PaystackChallengeTests
//
//  Created by Masud Onikeku on 03/07/2024.
//

import XCTest
//import ViewInspector
@testable import PaystackChallenge

final class PaystackChallengeTests: XCTestCase {

    func testViewModelGetData() {
        
        let exp = expectation(description: "Got repository lists")
        let viewModel = ViewModel()
        let cancellable = viewModel.$repoResponse.sink(receiveValue: {response in
            
            if let obj = response?.object {
                
                XCTAssertTrue(obj is [APIRepo])
                exp.fulfill()
                
            }else {
                if let sucessful = response?.successful {
                    if !sucessful {
                        XCTAssertTrue(true)
                        exp.fulfill()
                    }else {
                        XCTAssertTrue(false)
                        exp.fulfill()
                    }
                }
            }
        })
        viewModel.getData(page: 1)
        wait(for: [exp], timeout: 10.0)
    }
    
    /*func testRepoListViewData() {
        
        let rep = repoListView(repo: dummyRepo.first!)
        
        let string = try? rep.inspect().find(repoListView.self).actualView().inspect().hStack().vStack(2).text(0).string()
        XCTAssertNotNil(string)
        XCTAssertEqual(string, dummyRepo.first?.name)
        
    }
    
    func testDetailRepresentableRepoData() {
        
        let dvc = DetailScreen(repo: dummyRepo.first!)
        let repView = try? dvc.inspect().vStack().find(detailRepresentable.self).actualView()
        
        XCTAssertEqual(repView?.repo, dummyRepo.first)
    }*/

}
