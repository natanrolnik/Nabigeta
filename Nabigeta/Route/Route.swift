//
// This file is part of Nabigeta
//
// Created by JC on 04/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

public class Route : NSObject, Routable {
    public let name: String
    public let destination: UIViewController.Type
    public let stack: NavigationStack
    public let options: RouteOptions

    lazy public private(set) var navigationStrategy: NavigationStrategy = (self.stack.isNewStack())
        ? PresentStrategy(route: self)
        : PushStrategy(route: self)

    public init(name: String, destination: UIViewController.Type, stack: NavigationStack, configure: (RouteOptions -> ())?) {
        self.name = name
        self.destination = destination
        self.stack = stack
        self.options = RouteOptions()

        configure?(self.options)
    }

    public convenience init(name: String, destination: UIViewController.Type, configure: (RouteOptions -> ())?) {
        self.init(name: name, destination: destination, stack: .Current, configure: configure)
    }
}