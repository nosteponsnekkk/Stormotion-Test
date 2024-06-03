//
//  MainCoordinator.swift
//  Stormotion-Test
//
//  Created by Oleg on 03.06.2024.
//

import UIKit

public final class MainCoordinator: CoordinatorObject {
    
    public override func start() {
        super.start()
        let vc = ListViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}

extension MainCoordinator {
    func openDetailFor(id: String?) {
        guard let id else { return }
        let vc = PostDetailViewController(id: id)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
