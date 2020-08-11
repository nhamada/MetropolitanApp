//
//  Bundle+SDK.swift
//  METBase
//
//  Created by Naohiro Hamada on 2020/08/11.
//  Copyright © 2020 Naohiro Hamada. All rights reserved.
//

import Foundation

private final class _METBase { }

internal extension Bundle {
    static var sdk: Bundle {
        Bundle(for: _METBase.self)
    }
}
