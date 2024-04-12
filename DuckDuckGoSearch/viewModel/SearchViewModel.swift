//
//  SearchViewModel.swift
//  DuckDuckGoSearch
//
//  Created by daniel ortiz millan on 10/04/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    //  let apliClient = APIClient()
    
    @Published var searchResults: Welcome?
    @Published var searchTextVM: String = ""
    
    private let apiClient = APIClient()
    
    func search(query: String) {
        apiClient.getSearchResult(query: query) { result in
            DispatchQueue.main.async {
                
                switch result {
                case .success(let welcome):
                    self.searchResults = welcome
                    print("results \(welcome.results)")
                case .failure(let error):
                    print("Error fetching search results: \(error)")
                    
                }
            }
        }
    }
    
}
