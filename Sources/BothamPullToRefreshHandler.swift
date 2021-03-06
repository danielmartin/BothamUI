//
//  BothamPullToRefreshHandler.swift
//  BothamUI
//
//  Created by Davide Mendolia on 26/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation

public class BothamPullToRefreshHandler: NSObject {
    let presenter: BothamPullToRefreshPresenter
    let refreshControl = UIRefreshControl()

    public init(presenter: BothamPullToRefreshPresenter) {
        self.presenter = presenter
        super.init()
    }

    public func addTo(scrollView: UIScrollView) {
        refreshControl.addTarget(self, action:Selector("refresh:"), forControlEvents:.ValueChanged)
        scrollView.addSubview(refreshControl)
        scrollView.alwaysBounceVertical = true
    }

    func refresh(refreshControl: UIRefreshControl)
    {
        presenter.didStartRefreshing()
    }

    public func endRefreshing() {
        self.refreshControl.endRefreshing()
    }
}