//
// This file is part of Nabigeta
//
// Created by JC on 07/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public protocol Resolver {
    typealias ElementType

    var onFulfilled:((element: ElementType) -> ())? { get set }
    var onFailed:((error: NSError) -> ())? { get set }

    func resolve(element: ElementType)
    func resolve(error: NSError)
}