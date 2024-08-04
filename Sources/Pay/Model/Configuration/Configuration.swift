//
//  Configuration.swift
//  Pay
//
//  Created by Giga Khizanishvili on 02.07.24.
//

import SwiftUI
import Combine

public final class Configuration: ObservableObject {
    let font: Font // TODO: Use appropriate Font
    let colorPalette: ColorPalette
    let companyIcon: Image?
    let transactionId: String
    let environment: ServiceEnvironment
    let successCompletionHandler: () -> Void
    let failureCompletionHandler: () -> Void

    public init(
        font: Font,
        colorPalette: ColorPalette,
        companyIcon: Image? = nil,
        transactionId: String,
        environment: ServiceEnvironment,
        successCompletionHandler: @escaping () -> Void,
        failureCompletionHandler: @escaping () -> Void
    ) {
        self.font = font
        self.colorPalette = colorPalette
        self.companyIcon = companyIcon
        self.transactionId = transactionId
        self.environment = environment
        self.successCompletionHandler = successCompletionHandler
        self.failureCompletionHandler = failureCompletionHandler
    }
}

// MARK: - ColorPalette
public extension Configuration {
    struct ColorPalette {
        let brand: Color
        let textPrimary: Color
        let textSecondary: Color
        let background: Color
        let surface: Color
        let stroke: Color
        let negative: Color

        public init(
            brand: MyColor? = nil,
            textPrimary: MyColor? = nil,
            textSecondary: MyColor? = nil,
            background: MyColor? = nil,
            surface: MyColor? = nil,
            stroke: MyColor? = nil,
            negative: MyColor? = nil
        ) {
            self.brand = brand?.colorValue ?? Color("payBrand", bundle: .module)
            self.textPrimary = textPrimary?.colorValue ?? Color("payTextPrimary", bundle: .module)
            self.textSecondary = textSecondary?.colorValue ?? Color("payTextSecondary", bundle: .module)
            self.background = background?.colorValue ?? Color("payBackground", bundle: .module)
            self.surface = surface?.colorValue ?? Color("paySurface", bundle: .module)
            self.stroke = stroke?.colorValue ?? Color("payStroke", bundle: .module)
            self.negative = negative?.colorValue ?? Color("payNegative", bundle: .module)
        }
    }
}

// MARK: - Example
extension Configuration {
    static var example: Self {
        Self(
            font: .body,
            colorPalette: .init(),
            companyIcon: Image(.airbnb),
            transactionId: UUID().uuidString,
            environment: .development,
            successCompletionHandler: { },
            failureCompletionHandler: { }
        )
    }
}
