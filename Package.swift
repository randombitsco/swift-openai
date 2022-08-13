// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "swift-openai-gpt3",
  platforms: [
    .macOS(.v12),
    .iOS(.v15),
    .tvOS(.v15),
    .watchOS(.v8),
  ],
  products: [
      // Products define the executables and libraries a package produces, and make them visible to other packages.
      .library(
        name: "OpenAIGPT3",
        targets: ["OpenAIGPT3"]),
      .executable(
        name: "openai",
        targets: ["openai"]),
  ],
  dependencies: [
      // Dependencies declare other packages that this package depends on.
    .package(url: "https://github.com/davbeck/MultipartForm", from: "0.1.0"),
    .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "0.5.0"),
    .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.0.3"),
  ],
  targets: [
      // Targets are the basic building blocks of a package. A target can define a module or a test suite.
      // Targets can depend on other targets in this package, and on products in packages this package depends on.
      .target(
        name: "OpenAIGPT3",
        dependencies: ["MultipartForm"],
        resources: [.copy("Resources")]),
      .testTarget(
        name: "OpenAIGPT3Tests",
        dependencies: [
          "OpenAIGPT3",
          .product(name: "CustomDump", package: "swift-custom-dump")
        ]),
      .executableTarget(
        name: "openai",
        dependencies: [
          "OpenAIGPT3",
          .product(name: "ArgumentParser", package: "swift-argument-parser"),
        ]),
  ]
)
