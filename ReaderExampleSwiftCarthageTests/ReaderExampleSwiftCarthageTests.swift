//
//  ReaderExampleSwiftCarthageTests.swift
//  ReaderExampleSwiftCarthageTests
//
//  Created by Evgeniy Sinev on 09/06/17.
//  Copyright © 2017 payneteasy. All rights reserved.
//

import XCTest
import PaynetEasyReader
import PayneteasyReaderI18n

class ReaderExampleSwiftCarthageTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testTranslation() {
        let readerEventTextProducer = ReaderEventTextProducer.init()
        let event = PNEReaderEvent.init(state: PNEReaderState.CONNECTED)
        let event_text = readerEventTextProducer.text(for: event);
        XCTAssertNotNil(event_text)
        XCTAssertNotEqual(event_text, "PNEReaderState_CONNECTED");
        NSLog(event_text!);
    }
}
