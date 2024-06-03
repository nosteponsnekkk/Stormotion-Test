//
//  ListViewController.swift
//  Stormotion-Test
//
//  Created by Oleg on 03.06.2024.
//

import UIKit
import WebKit

public final class ListViewController: UIViewController {
    
    //MARK: - Coordinator
    weak var coordinator: MainCoordinator?
    
    //MARK: - Data
    private let viewModel = ListViewModel()
  
    //MARK: - View
    private var webView: WKWebView?

    //MARK: - Lifecycle
    public override func loadView() {
        webView = WKWebView()
        if let webView {
            view = webView
            webView.configuration.userContentController.add(viewModel,
                                                            name: APIManager.shared.handlerName)
            webView.navigationDelegate = viewModel
        }
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        if let request = APIManager.shared.apiHomeRequest {
            webView?.load(request)
        }
        bind()
    }

    //MARK: - Methods
    private func bind(){
        viewModel.bind { [weak self] id in
            self?.coordinator?.openDetailFor(id: id)
        }
    }
}
