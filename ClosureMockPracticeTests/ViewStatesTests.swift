//
//  ViewStatesTests.swift
//  ClosureMockPracticeTests
//
//  Created by Kotaro Fukuo on 2022/07/17.
//

import XCTest
@testable import ClosureMockPractice

@MainActor
final class ViewStatesTests: XCTestCase {
    func testSuccess() async throws {
        let viewStates = ViewStates(client: .success)
        await viewStates.fetch()
        XCTAssertEqual("Sunny", viewStates.result)
    }
    
    func testFailure() async throws {
        let viewStates = ViewStates(client: .failure)
        await viewStates.fetch()
        XCTAssertEqual("Error happened", viewStates.result)
    }
}
