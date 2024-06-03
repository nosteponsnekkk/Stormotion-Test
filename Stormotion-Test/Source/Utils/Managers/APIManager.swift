//
//  APIManager.swift
//  Stormotion-Test
//
//  Created by Oleg on 03.06.2024.
//

import Foundation

public final class APIManager {
    
    public static let shared = APIManager()
    private init(){}
    
    private let homeLink = "https://theatlasnews.co/ml-api/v2/list"
    private let postLink = "https://theatlasnews.co/ml-api/v2/post?post_id="
    
}

//MARK: - Constants
extension APIManager {
    public var handlerName: String {
        "nativeFunctions"
    }
    public var idKey: String {
        return "id"
    }
    public var script: String? {
        if let url = Bundle.main.url(forResource: "nativeFunctions", withExtension: "js") {
            do {
                return try String(contentsOf: url)
            } catch {
                print("Error loading JavaScript file: \(error.localizedDescription)")
            }
        } else {
            print("JavaScript file not found.")
        }
        return nil

    }
    public var apiHomeRequest: URLRequest? {
        if let url = URL(string: homeLink) {
            return URLRequest(url: url)
        }
        return nil
    }
    public func getPostRequest(for id: String) -> URLRequest? {
        if let url = URL(string: postLink + id) {
            return URLRequest(url: url)
        }
        return nil
    }
}

