//
// This file is part of Nabigeta
//
// Created by JC on 04/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

public class RouteCollection : SequenceType {
    private var routes: Dictionary<String, Routable> = [:]
    private var routerURL: RouteURLRouter = RouteURLRouter()

    public func add(route: Routable) {
        self.routes[route.name] = route
        self.routerURL.bind(route)
    }

    public subscript(name: String) -> Routable? {
        get { return self.routes[name] }
    }

    public subscript(url: NSURL) -> RouteURLRouter.MatchResultType? {
        get { return self.routerURL.match(url) }
    }

    public func generate() -> DictionaryGenerator<String, Routable> {
        return self.routes.generate()
    }
}