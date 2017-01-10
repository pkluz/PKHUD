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
    }

    override func tearDown() {
        super.tearDown()
    }

    func testAnimatedSuccessHUD() {
        app.buttons["Animated Success HUD"].tap()
        self.waitForHudToDisappear()
    }

    func testAnimatedErrorHUD() {
        app.buttons["Animated Error HUD"].tap()
        self.waitForHudToDisappear()
    }

    func testAnimatedProgressHUD() {
        app.buttons["Animated Progress HUD"].tap()
        self.waitForHudToDisappear()
    }

    func testAnimatedStatusProgressHUD() {
        app.buttons["Animated Status Progress HUD"].tap()
        self.waitForHudToDisappear()
    }

    func testCustomAnimatedProgressHUD() {
        app.buttons["Custom Animated Progress HUD"].tap()
        self.waitForHudToDisappear()
    }

    func testTextHUD() {
        app.buttons["Text HUD"].tap()
        self.waitForHudToDisappear()
    }

    func waitForHudToDisappear() {
        self.waitForElementToAppear(element: app.otherElements["PKHUD.PKHUD"], timeout: 2.2)
    }

    func waitForElementToAppear(element: XCUIElement, timeout: TimeInterval = 5) {
        let notExistsPredicate = NSPredicate(format: "exists == false")
        expectation(for: notExistsPredicate, evaluatedWith: element, handler:nil)
        waitForExpectations(timeout: timeout, handler: nil)
    }
}
