//
//  Chapter1.swift
//  fpinswift
//
//  Created by Bryan Smith on 12/23/14.
//  Copyright (c) 2014 Bryan Smith. All rights reserved.
//

import Foundation
import UIKit

//
public typealias Position = CGPoint
public typealias Distance = CGFloat
public typealias Region   = Position -> Bool

//
public func circle(radius: Distance) -> Region {
    return { pt in
        sqrt(pt.x * pt.x + pt.y * pt.y) <= radius
    }
}

//
public func shift(offset: Position, region: Region) -> Region {
    return { pt in
        //
        // Since:
        //   circle + offset = position
        // Then
        //   circle = position - offset
        //
        let shifted = Position(x: pt.x - offset.x, y:pt.y - offset.y)
        return region(shifted)
    }
}

//
public func invert(region: Region) -> Region {
    return { pt in
        return !region(pt)
    }
}

//
public func intersection(region1: Region, region2: Region) -> Region {
    return { pt in region1(pt) && region2(pt) }
}

//
public func union(region1: Region, region2: Region) -> Region {
    return { pt in region1(pt) || region2(pt) }
}

//
public func difference(region: Region, minusRegion: Region) -> Region {
    return intersection(region, invert(minusRegion))
}

let minimumRange:Distance = 2.0

//
// Determine whether a target is in range without compromising a friendly unit.
//
public func inRange(ownPosition: Position, target: Position,
    friendly: Position, range: Distance) -> Bool {
        
    let rangeRegion     = difference(circle(range), circle(minimumRange))
    let targetRegion    = shift(ownPosition, rangeRegion)
    let friendlyRegion  = shift(friendly, circle(minimumRange))
    let resultRegion    = difference(targetRegion, friendlyRegion)
        
    return resultRegion(target)
}

