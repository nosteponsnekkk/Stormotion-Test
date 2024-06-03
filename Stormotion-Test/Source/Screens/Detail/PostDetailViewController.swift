//
//  PostDetailViewController.swift
//  Stormotion-Test
//
//  Created by Oleg on 03.06.2024.
//

import UIKit
import WebKit

public final class PostDetailViewController: UIViewController {
    
    //MARK: - Coordinator
    weak var coordinator: MainCoordinator?
    
    //MARK: - Data
    private let id: String
  
    //MARK: - View
    private var webView: WKWebView?

    //MARK: - Init
    init(id: String) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    public override func loadView() {
        webView = WKWebView()
        if let webView {
            view = webView
        }
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        if let request = APIManager.shared.getPostRequest(for: id) {
            webView?.load(request)
        }
    }


}
