//
//  PostsListInteractor.swift
//  DailyViper
//
//  Created by Ferrakkem Bhuiyan on 2021-02-03.
//

import Foundation

class PostsListInteractor: PresenterToInteractorPostsListProtocol {
    var ps = PostService()
    var presenter: InteractorToPresenterPostsListProtocol?

    func loadPosts() {
        print("v3")
        ps.getPosts {(result) in
            switch result{
            
            case .success(let listOff):
                self.presenter?.postsSuccess(postList: listOff)
            case .failure( _):
                self.presenter?.postsFailed()
            }
        }
    }
}

