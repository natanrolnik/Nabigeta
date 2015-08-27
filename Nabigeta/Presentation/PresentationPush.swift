//
//  Strategy.swift
//  Nabigeta
//
//  Created by JC on 06/11/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation
import UIKit

public class PresentationPush : PresentationStrategy {

    public func show(navigationContext: NavigationContext, willShow: PresentationWillShowHandler?) {
        var destinationViewController: UIViewController = navigationContext.route.destination.init()
        var stackController = navigationContext.sourceViewController.navigationController!

        willShow?(destinationViewController, navigationContext.context)
        stackController.pushViewController(destinationViewController, animated: true)
    }

    public func dismiss(sender: UIViewController) {
        sender.navigationController?.popToViewController(sender, animated: true)
    }
}