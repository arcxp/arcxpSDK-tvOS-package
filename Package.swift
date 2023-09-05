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
        return "https://d3mh65msdilczf.cloudfront.net/home/iosArcXPSDK/version_1.0.2/SDK/\(targetName).zip" 
    }
}

extension String {
    enum BinaryTarget {
        static let arcXPsdk = "ArcXP"
        static let googleAds = "GoogleInteractiveMediaAds"
        static let palSDK = "ProgrammaticAccessLibrary"
    }
    
    enum CheckSum {
        static let arcXPsdk_CS = "02dae8a5a48fcff7ac8cb79d0a51082872659fea8a1705eae855d82ec8247894"
        static let googleAds_CS = "83cc987dfceeb9a08937200352b2b539e3403a08826c7100b6fc59aad3505f7a"
        static let palSDK_CS = "aa1bee22ecc963f538ac11e63a7c8bda52a77f8a109232dc6351589c3d0af2dc"
    }
}
