//
// This file is part of Nabigeta
//
// Created by JC on 10/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import Router

public struct RouteURLRouter {
    public typealias MatchResultType = (route: Routable, req: URLRequest)

    private let router: Router = Router()
    private var lastMatch: MatchResultType?

    public mutating func bind(route: Routable) {
        if let url = route.url {
            self.router.bind(url) { req in
                self.lastMatch = (route: route, req: req)
            }
        }
    }

    public mutating func match(url: NSURL) -> MatchResultType? {
        self.lastMatch = nil
        self.router.match(url)

        return self.lastMatch
    }
}