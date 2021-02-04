//
//  PostsListPresenter.swift
//  DailyViper
//
//  Created by Ferrakkem Bhuiyan on 2021-02-03.
//

import Foundation


class PostsListPresenter: ViewToPresenterPostsListProtocol{
    var view: PresenterToViewPostsListProtocol?
    
    var interactor: PresenterToInteractorPostsListProtocol?
    
    var router: PresenterToRouterPostsListProtocol?
    
    func fetchPosts() {
        print("v2")
        print("Presenting")
        interactor?.loadPosts()
    }
    
}

extension PostsListPresenter: InteractorToPresenterPostsListProtocol{
    func postsSuccess(postList: Array<Post>) {
        view?.onPostResponseSucces(postsList: postList)
    }
    
    func postsFailed() {
        view?.onPostResponseFailed(error: "Parsing Error")
    }
    
    
}
