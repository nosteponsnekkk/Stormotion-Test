//
//  Coordinator.swift
//  Stormotion-Test
//
//  Created by Oleg on 03.06.2024.
//

import UIKit

public protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController { get set }
    func start()
    
}

