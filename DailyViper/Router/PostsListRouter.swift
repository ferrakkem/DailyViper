//
//  PostsListRouter.swift
//  DailyViper
//
//  Created by Ferrakkem Bhuiyan on 2021-02-03.
//

import Foundation
import UIKit

class PostsListRouter: PresenterToRouterPostsListProtocol {
    
    class func createPostsListModule(postsListRef: PostsViewController) {
        
        let presenter: ViewToPresenterPostsListProtocol & InteractorToPresenterPostsListProtocol = PostsListPresenter()
        
        postsListRef.postsPresenter = presenter
        postsListRef.postsPresenter?.router = PostsListRouter()
        postsListRef.postsPresenter?.view = postsListRef
        postsListRef.postsPresenter?.interactor = PostsListInteractor()
        postsListRef.postsPresenter?.interactor?.presenter = presenter
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
