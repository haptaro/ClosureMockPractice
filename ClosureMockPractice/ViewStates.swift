//
//  ViewStates.swift
//  ClosureMockPractice
//
//  Created by Kotaro Fukuo on 2022/07/17.
//

import Foundation

@MainActor
final class ViewStates: ObservableObject {
    @Published private(set) var result: String = "loading..."
    private let client: APIClient
    
    init(client: APIClient) {
        self.client = client
    }
        
    func fetch() async {
        do {
            let text = try await client.send()
            result = text
        } catch {
            result = "Error happened"
        }
    }
}
