//
//  ChibyItemView.swift
//  ViewFTR
//
//  Created by Kazakh on 14.02.2023.
//

import SwiftUI
import Foundation

// MARK: - ChibyItemView

public struct ChibyItemView: View {
    
    // MARK: - Properties
    
    /// Chiby item image name
    public let imageName: String
    
    /// Chiby item name
    public let itemLabel: String
    
    /// Indicate if view 'SOON' is needed
    public var isHaveBadge: Bool
    
    // MARK: - View
    
    /// View container with label, image and badge if it is needed
    public var body: some View {
        GeometryReader { proxy in
            ZStack {
                VStack{
                    Spacer()
                    Text(itemLabel)
                        .lineLimit(1)
                        .padding(.bottom, LayoutConstants.labelPaddingBottom)
                        .padding(.horizontal, LayoutConstants.itemLabelHorizontalPadding)
                        .font(.system(size: 17, weight: .medium))
                        .minimumScaleFactor(0.38)
                }
                VStack {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, LayoutConstants.imageHorizontalPadding)
                        .frame(height: proxy.size.width / LayoutConstants.imagScaleFactor, alignment: .center)
                }
            }
            .frame(width: proxy.size.width, height: proxy.size.width)
            .background(Color.white)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: LayoutConstants.viewCornerRadius,
                    style: .continuous
                )
            )
            .overlay(
                VStack {
                    HStack {
                        if isHaveBadge {
                            Spacer()
                            SoonBadgeView {
                                Text("SOON")
                                    .lineLimit(1)
                                    .font(.system(size: 15, weight: .medium))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, LayoutConstants.badgeLabelHorizontalPadding)
                                
                            }
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: LayoutConstants.badgeCornerRadius,
                                    style: .continuous
                                )
                            )
                        }
                    }
                    Spacer()
                }
                    .padding(LayoutConstants.badgePadding)
            )
        }
    }
}

// MARK: - SoonView

/// Badge view, for example 'soon' badge
public struct SoonBadgeView<Content: View>: View {
    
    /// Content to show
    public let content: () -> Content
    
    // MARK: - Initializer
    
    /// - Parameters:
    ///   - content: The content to which wiil aplly parameters below
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        content()
            .padding(LayoutConstants.badgeLabelPadding)
            .background(Color("soonColor"))
            .minimumScaleFactor(0.38)
    }
}

// MARK: - Layout

private enum LayoutConstants {
    
    static let badgeLabelPadding: CGFloat = 4
    static let badgeLabelHorizontalPadding: CGFloat = 2
    static let viewCornerRadius: CGFloat = 24
    static let badgeCornerRadius: CGFloat = 44
    static let imagScaleFactor: CGFloat = 1.7
    static let itemLabelHorizontalPadding: CGFloat = 6
    static let imageHorizontalPadding: CGFloat = 35
    static let cornerRadius: CGFloat = 24
    static let badgePadding: CGFloat = 12
    static let labelPaddingBottom: CGFloat = 16
}

// MARK: - UIScreen

extension UIScreen {
    
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
