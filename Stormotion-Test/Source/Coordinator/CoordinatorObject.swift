//
//  CoordinatorObject.swift
//  Stormotion-Test
//
//  Created by Oleg on 03.06.2024.
//

import UIKit

public class CoordinatorObject: Coordinator {
        
    public var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    public func start() {
        print("Did start Coordinator: \(String(describing: self))")
    }
    
}
