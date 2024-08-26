//
//  SlackLogger.swift
//
//
//  Created by Daniel Marriner on 11/08/2024.
//

import Foundation
import SlackKit

public struct SlackLogger {
    private let bot: SlackKit

    public init(token: String) {
        let bot = SlackKit()
        bot.addWebAPIAccessWithToken(token)

        self.bot = bot
    }

    public func log(
        severity: MessageSeverity,
        channel: String,
        message: String,
        title: String?
    ) async throws {
        try await withCheckedThrowingContinuation { continuation in
            bot.webAPI?.authenticationTest { _, _ in
                continuation.resume()
            } failure: { error in
                continuation.resume(throwing: error)
            }
        }

        try await withCheckedThrowingContinuation { continuation in
            bot.webAPI?.sendMessage(
                channel: channel,
                text: "",
                attachments: [
                    Attachment(
                        fallback: "An error occurred. Please inspect the server logs",
                        title: title ?? "",
                        colorHex: severity.color,
                        text: message
                    )
                ],
                success: { _ in continuation.resume() },
                failure: { error in continuation.resume(throwing: error) }
            )
        }
    }
}
