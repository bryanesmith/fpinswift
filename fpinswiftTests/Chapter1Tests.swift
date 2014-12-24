//
//  Chapter1Tests.swift
//  fpinswift
//
//  Created by Bryan Smith on 12/23/14.
//  Copyright (c) 2014 Bryan Smith. All rights reserved.
//

import XCTest
import UIKit
import fpinswift

class Chapter1Tests: XCTestCase {
    
    //
    func testThatCircleReturnsTrue() {
        // Given
        let c = circle(5)
        
        // When
        let pos = Position(x: 3, y: 3)
        
        // Then
        XCTAssert(c(pos))
    }
    
    //
    func testThatCircleReturnsFalse() {
        // Given
        let c = circle(5)
        
        // When
        let pos = Position(x: 6, y: 3)
        
        // Then
        XCTAssertFalse(c(pos))
    }
    
    //
    func testThatShiftReturnsTrue() {
        // Given
        let r = shift(Position(x:10,y:10), circle(5))
        
        // When
        let pos = Position(x: 11, y: 11)
        
        // Then
        XCTAssert(r(pos))
    }

    //
    func testThatShiftReturnsFalse() {
        // Given
        let r = shift(Position(x:10,y:10), circle(5))
        
        // When
        let pos = Position(x: 4, y: 4)
        
        // Then
        XCTAssertFalse(r(pos))
    }
    
    //
    func testThatInvertReturnsTrue() {
        // Given
        let r = invert(circle(5))
        
        // When
        let pos = Position(x: 6, y: 3)
        
        // Then
        XCTAssert(r(pos))
    }
    
    //
    func testThatInvertReturnsFalse() {
        // Given
        let r = invert(circle(5))
        
        // When
        let pos = Position(x: 3, y: 3)
        
        // Then
        XCTAssertFalse(r(pos))
    }
    
    // 
    func testThatIntersectionReturnsTrue() {
        
        // Given
        let r = intersection(circle(5), invert(circle(3))) // Donut
        
        // When
        let pos = Position(x: 3, y: 3)
        
        // Then
        XCTAssert(circle(5)(pos))
        XCTAssert(r(pos))
    }
    
    // 
    func testThatIntersectionReturnsFalse() {
        
        // Given
        let r = intersection(circle(5), invert(circle(3))) // Donut
        
        // When
        let pos = Position(x: 2, y: 2)
        
        // Then
        XCTAssertFalse(r(pos))
    }
    
    //
    func testThatUnionReturnsTrue() {
        
        // Given
        let r = union(circle(5), shift(Position(x:5,y:5), circle(5)))
        
        // When
        let pos = Position(x: 7, y: 7)
        
        // Then
        XCTAssert(r(pos))
    }
    
    //
    func testThatUnionReturnsFalse() {
        // Given
        let r = union(circle(5), shift(Position(x:5,y:5), circle(5)))
        
        // When
        let pos = Position(x: 11, y: 11)
        
        // Then
        XCTAssertFalse(r(pos))
    }
}
