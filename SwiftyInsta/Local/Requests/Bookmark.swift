//
//  Bookmark.swift
//  SwiftyInsta
//
//  Modified by Stefano Bertagno on 11/3/18.
//  V. 2.0 by Stefano Bertagno on 7/21/19.
//  Copyright © 2018 Mahdi. All rights reserved.
//

import Foundation

/// A `struct` holding reference to a given page.
public struct Bookmark {
    /// The `maxId`.
    public let maxId: String?
    /// The `count`.
    let pagesToLoad: Int

    // MARK: Lifecycle
    /// Init.
    init(maxId: String?, count counter: Int) {
        precondition(counter > 0, "`count` must be bigger than `0`.")
        self.maxId = maxId
        self.pagesToLoad = count
    }
    /// Update.
    func next(_ maxId: String?) -> Bookmark? {
        guard let id = maxId, !id.isEmpty, pagesToLoad > 1 else { return nil }
        return .init(maxId: id, count: pagesToLoad-1)
    }

    @available(*, deprecated, message: "Use `enum`-like `static` `func`s and `var`s instead (e.g. `.first`, `.upTo()`, `.everything`...).")
    /// Legacy initializer for `PaginationParameters`.
    /// Use `enum`-like `static` `func`s and `var`s instead (e.g. `.first`, `.upTo()`, `.everything`...).
    public init(startingAt maxId: String? = nil, maxPagesToLoad: Int = 1) {
        precondition(maxPagesToLoad > 0, "`maxPagesToLoad` must be bigger than `0`.")
        self.maxId = maxId
        self.pagesToLoad = maxPagesToLoad
    }

    // MARK: `enum`-like
    /// Obtain first page alone.
    public static var first: Bookmark { return .init(maxId: nil, count: 1) }
    /// Obtain first `count` pages.
    public static func upTo(_ count: Int) -> Bookmark { return .init(maxId: nil, count: count) }
    /// Obtain everything.
    public static var everything: Bookmark { return .init(maxId: nil, count: .max) }
    /// Obtain `count` pages starting with `maxId`.
    public static func from(_ maxId: String?, upTo count: Int) -> Bookmark { return .init(maxId: maxId, count: count) }
}

@available(*, deprecated, message: "Use `Bookmark` instead.")
/// Legacy typealias.
public typealias PaginationParameters = Bookmark
