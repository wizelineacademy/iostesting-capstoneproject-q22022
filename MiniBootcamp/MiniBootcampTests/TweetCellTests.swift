//
//  TweetCellTests.swift
//  MiniBootcampTests
//
//  Created by Fernando de la Rosa on 17/05/23.
//

import XCTest
@testable import MiniBootcamp

final class TweetCellTests: XCTestCase {
    func test_createTweetCell() {
        let sut = TweetCell()
        
        XCTAssertEqual(sut.backgroundColor, .systemBackground)
    }
    
    func test_configureCellInformation() {
        let sut = TweetCell()
        let expectedViewModel = TweetCellViewModel(
            user: TweetCellViewModel.UserInfo(
                userName: "dummy-username",
                profileName: "dummy-profileName",
                profilePictureName: "cat"
            ),
            content: "dummy-content"
        )
        
        sut.viewModel = expectedViewModel
        
        XCTAssertEqual(sut.usernameLabel.text, expectedViewModel.user.userName)
        XCTAssertEqual(sut.nameLabel.text, expectedViewModel.user.profileName)
        XCTAssertEqual(sut.contentLabel.text, expectedViewModel.content)
        XCTAssertEqual(sut.userImageView.image, expectedViewModel.profilePicture)
    }
}

