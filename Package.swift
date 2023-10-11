// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PostHog",
    platforms: [
        .iOS(.v11), .tvOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PostHog",
            targets: ["PostHog"]),
    ],
    dependencies: [
        .package(name: "LocalizedDeviceModel", url: "https://github.com/bixcorp/BDLocalizedDevicesModels", from: "3.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "PostHog",
            dependencies: ["LocalizedDeviceModel"],
            path: "PostHog/",
            exclude: ["Info.plist"],
            sources: ["Classes",
                      "Internal",
                      "Vendor"],
            publicHeadersPath: "Classes",
            cSettings: [
                .headerSearchPath("Vendor"),
                .headerSearchPath("Internal"),
                .headerSearchPath("Classes"),
            ]
        )
    ]
)
