//
//  RouteCollection.swift
//  Nabigeta
//
//  Created by JC on 04/11/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation
import UIKit

public class Navigator : NSObject {
    public var willNavigate: PresentationWillShowHandler?

    private var routesCollection: Array<RouteCollection>

    public override init() {
        self.routesCollection = []
    }

    public convenience init(routeCollection: RouteCollection) {
        self.init()
        self.importCollection(routeCollection)
    }

    public func importCollection(routeCollection: RouteCollection) {
        self.routesCollection.append(routeCollection)
    }

    @objc(navigate:context:sender:)
    public func navigate(name: String, context: AnyObject, sender: UIViewController) {
        for routes in self.routesCollection {
            routes[name].map { route in
                self.navigate(route, context: context, sender: sender)
            }
        }
    }

    @objc(navigateURL:sender:)
    public func navigate(url: NSURL, sender: UIViewController) {
        for collection in self.routesCollection {
            if let matching = collection[url] {
                self.navigate(matching.route, context: nil, sender: sender)
            }
        }
    }

    private func navigate(route: Routable, context: AnyObject?, sender: UIViewController) {
        let navigationController = sender.navigationController
        let navContext = NavigationContext(source: sender, route: route, context: context)

        sender.navigationContext = navContext
        navContext.presenter.show(navContext, willShow: self.willNavigate)
    }

    public func navigateBack(sender: UIViewController) {
        sender.navigationContext?.presenter.dismiss(sender)
    }

    public func redirect() {

    }

    public func urlFor(name: String, context: AnyObject) -> String? {
        // 1. retrieve route by name
        // 2. generate url
        return nil
    }
}