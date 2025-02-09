// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "CoreLibrary",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CoreLibrary",
            targets: ["CoreLibrary"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.10.2"),
        .package(url: "https://github.com/OpenCombine/OpenCombine.git", from: "0.14.0")
    ],
    targets: [
        .target(
            name: "CoreLibrary",
            dependencies: ["Alamofire","OpenCombine"],
            path: "CoreLibrary"
        ),
        .testTarget(
            name: "CoreLibraryTests",
            dependencies: ["CoreLibrary"],
            path: "CoreLibraryTests"
        ),
    ]
)