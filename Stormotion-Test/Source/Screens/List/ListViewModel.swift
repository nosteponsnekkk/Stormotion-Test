//
//  ListViewModel.swift
//  Stormotion-Test
//
//  Created by Oleg on 03.06.2024.
//

import Foundation
import WebKit
import Combine

public final class ListViewModel: NSObject, ObservableObject {
    @Published var selectedPostID: String?
    private var cancellables: Set<AnyCancellable> = []
}

//MARK: - Webview delegation
extension ListViewModel: WKNavigationDelegate, WKScriptMessageHandler {
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == APIManager.shared.handlerName,
            let body = message.body as? [String: Any] {
            let id = body[APIManager.shared.idKey] as? String
            selectedPostID = id
        }

    }
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if let script = APIManager.shared.script {
            webView.evaluateJavaScript(script)
        }
    }
}

//MARK: - Binding
extension ListViewModel {
    public func bind(completion: @escaping (_ id: String? ) -> Void){
        $selectedPostID
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: completion)
            .store(in: &cancellables)
    }
}
