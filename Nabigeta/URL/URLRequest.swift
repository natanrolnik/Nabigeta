//
// This file is part of Nabigeta
//
// Created by JC on 07/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public protocol URLRequest {
    func param(name: String) -> String?
    func query(name: String) -> String?
}