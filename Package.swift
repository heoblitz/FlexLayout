// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "FlexLayout",
  products: [
    .library(name: "FlexLayout", targets: ["FlexLayout"]),
  ],
  targets: [
    .target(
      name: "FlexLayout",
      dependencies: ["FlexLayoutYogaKit"],
      path: "Sources/Swift",
      publicHeadersPath: "Public"
    ),
    .target(
      name: "FlexLayoutYogaCore",
      dependencies: [],
      path: "Sources/YogaCore",
      publicHeadersPath: ".",
      cxxSettings: [.headerSearchPath(".")]
    ),
    .target(
      name: "FlexLayoutYogaKit",
      dependencies: ["FlexLayoutYogaCore"],
      path: "Sources/YogaKit",
      publicHeadersPath: "include/YogaKit"
    ),
    .testTarget(
      name: "FlexLayoutTests",
      dependencies: [
        "FlexLayout",
      ]
    ),
  ],
  cxxLanguageStandard: CXXLanguageStandard(rawValue: "c++20")
)
