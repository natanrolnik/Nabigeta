//
//  Strategy.swift
//  Nabigeta
//
//  Created by JC on 06/11/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation
import UIKit

public enum PresentationPushMode {
    case Master
    case Detail
}

public class PresentationPush : PresentationStrategy {
    let pushMode: PresentationPushMode

    init(pushMode: PresentationPushMode? = nil) {
        self.pushMode = pushMode ?? .Master
    }

    public func show(navigationContext: NavigationContext, willShow: PresentationWillShowHandler?) {
        let destinationViewController: UIViewController = navigationContext.route.destination.init()
        let stackController = navigationContext.sourceViewController.navigationController!

        willShow?(destinationViewController, navigationContext.context)

        switch self.pushMode {
        case .Master:
            stackController.showViewController(destinationViewController, sender: navigationContext.sourceViewController)
        case .Detail:
            stackController.showDetailViewController(destinationViewController, sender: navigationContext.sourceViewController)
        }

    }

    public func dismiss(sender: UIViewController) {
        sender.navigationController?.popToViewController(sender, animated: true)
    }
}