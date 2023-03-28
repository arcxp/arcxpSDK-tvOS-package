// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let package = Package(
    name: "ArcXP",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ArcXP",
            targets: [.BinaryTarget.arcXPsdk,
                      .BinaryTarget.googleAds,
                      .BinaryTarget.palSDK])
    ],
    targets: [
        .BinaryTarget.arcXPsdk,
        .BinaryTarget.googleAds,
        .BinaryTarget.palSDK
    ]
)

extension Target {
    
    enum BinaryTarget {
        static let arcXPsdk = binaryTarget(
            name: .BinaryTarget.arcXPsdk,
            remoteChecksum: .CheckSum.arcXPsdk_CS
        )

        static let googleAds = binaryTarget(
            name: .BinaryTarget.googleAds,
            remoteChecksum: .CheckSum.googleAds_CS
        )

        static let palSDK = binaryTarget(
            name: .BinaryTarget.palSDK,
            remoteChecksum: .CheckSum.palSDK_CS
        )
    }

    static func binaryTarget(name: String, remoteChecksum: String) -> Target {
        return .binaryTarget(
            name: name,
            url: remoteBinaryURLString(for: name),
            checksum: remoteChecksum
        )
    }
    
    static func remoteBinaryURLString(for targetName: String) -> String {
        return "https://arc-mobile-sdks.s3.amazonaws.com/home/iosArcXPSDK/version_0.0.3/SDK/\(targetName).zip" 
    }
}

extension String {
    enum BinaryTarget {
        static let arcXPsdk = "ArcXP"
        static let googleAds = "GoogleInteractiveMediaAds"
        static let palSDK = "ProgrammaticAccessLibrary"
    }
    
    enum CheckSum {
        static let arcXPsdk_CS = "e8eb9526745358aef3fc01579fc7043e978a96dffbac0eb9865f36e05cc5e14c"
        static let googleAds_CS = "6eddf99a538ee806fc03bcafd12e7a43e945261058b3e3e4eb911d20cc2cb098"
        static let palSDK_CS = "ebaaee9fdac050c009000059065d62ed2cddf4b19cd442d0ce39021a8453352e"
    }
}
