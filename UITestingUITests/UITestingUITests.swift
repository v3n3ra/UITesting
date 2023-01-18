//
//  UITestingUITests.swift
//  UITestingUITests
//
//  Created by V K on 18.01.2023.
//

import XCTest

final class UITestingUITests: XCTestCase {

    func testAddNoiseMaker() {
        let app = XCUIApplication()
        app.launch()
        
        let newNameBtn = app.navigationBars["Noise Makers"].buttons["Add"]
        let nameField = app.alerts["Add Noise Maker"].scrollViews.otherElements.collectionViews.textFields["Name"]
        let addBtn = app.alerts["Add Noise Maker"].scrollViews.otherElements.buttons["Add"]
        let addedCell = app.tables.staticTexts["Venera"]
        
        newNameBtn.tap()
        nameField.tap()
//        nameField.typeText("Varvara")
        nameField.typeText("Venera")
        
        XCTAssertFalse(addedCell.exists)
        addBtn.tap()
        XCTAssertTrue(addedCell.exists)
    }
    
    func testDeleteNoiseMaker() {
        
        let app = XCUIApplication()
        app.launch()
        
        let newNameBtn = app.navigationBars["Noise Makers"].buttons["Add"]
        let nameField = app.alerts["Add Noise Maker"].scrollViews.otherElements.collectionViews.textFields["Name"]
        let addBtn = app.alerts["Add Noise Maker"].scrollViews.otherElements.buttons["Add"]
        let addedCell = app.tables.staticTexts["Varvara"]
        let tablesQuery = app.tables
        let deleteBtn = tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        newNameBtn.tap()
        nameField.tap()
        nameField.typeText("Varvara")
        addBtn.tap()
        
        addedCell.swipeLeft()
        deleteBtn.tap()
        
        XCTAssertFalse(addedCell.exists)
    }
}
