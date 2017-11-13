//
//  PKHUDUITests.swift
//  PKHUDUITests
//
//  Created by Piergiuseppe Longo on 10/01/2017.
//  Copyright © 2017 NSExceptional. All rights reserved.
//

import XCTest
import PKHUD

class PKHUDUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
        XCTAssertFalse(PKHUD.sharedHUD.isVisible)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testAnimatedSuccessHUD() {
        app.buttons["Animated Success HUD"].tap()
        self.waitForHudToAppear()
        self.waitForHudToDisappear()
    }

    func testAnimatedErrorHUD() {
        app.buttons["Animated Error HUD"].tap()
        self.waitForHudToAppear()
        self.waitForHudToDisappear()
    }

    func testAnimatedProgressHUD() {
        app.buttons["Animated Progress HUD"].tap()
        self.waitForHudToAppear()
        self.waitForHudToDisappear()
    }

    func testAnimatedStatusProgressHUD() {
        app.buttons["Animated Status Progress HUD"].tap()
        self.waitForHudToAppear()
        self.waitForHudToDisappear()
    }

    func testCustomAnimatedProgressHUD() {
        app.buttons["Custom Animated Progress HUD"].tap()
        self.waitForHudToAppear()
        self.waitForHudToDisappear()
    }

    func testTextHUD() {
        app.buttons["Text HUD"].tap()
        self.waitForHudToAppear()
        self.waitForHudToDisappear()
    }

    func waitForCondition(element: XCUIElement, predicate: NSPredicate, timeout: TimeInterval = 3.5) {
        expectation(for: predicate, evaluatedWith: element, handler:nil)
        waitForExpectations(timeout: timeout, handler: nil)
    }

    func waitForHudToDisappear() {
        self.waitForCondition(element: app.otherElements["PKHUD"], predicate: NSPredicate(format: "exists == false"))
    }

    func waitForHudToAppear() {
            self.waitForCondition(element: app.otherElements["PKHUD"], predicate: NSPredicate(format: "exists == true"), timeout: 1.5)
    }
}
