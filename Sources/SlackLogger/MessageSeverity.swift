//
//  MessageSeverity.swift
//  
//
//  Created by Daniel Marriner on 26/08/2024.
//

import Foundation

public enum MessageSeverity {
    case debug
    case info
    case notice
    case warning
    case critical
    case error

    var color: String {
        return switch self {
            case .debug:    "#e303fc"
            case .info:     "#31708f"
            case .notice:   "#4f8a10"
            case .warning:  "#9f6000"
            case .critical: "#fc8403"
            case .error:    "#ff0040"
        }
    }
}
