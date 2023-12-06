// swift-tools-version: 5.5

//
// Copyright 2023 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


import PackageDescription

let package = Package(
  name: "GoogleMaps", platforms: [.iOS(.v14)],
  products: [
    .library(name: "GoogleMaps", targets: ["GoogleMapsTarget"]),
    .library(name: "GoogleMapsCore", targets: ["GoogleMapsCoreTarget"]),
    .library(name: "GoogleMapsBase", targets: ["GoogleMapsBaseTarget"]),
    .library(name: "GoogleMapsM4B", targets: ["GoogleMapsM4BTarget"]),
  ], dependencies: [],
  targets: [
    .binaryTarget(
      name: "GoogleMaps", url: "https://dl.google.com/geosdk/swiftpm/8.3.1/GoogleMaps_3p.xcframework.zip",
      checksum: "4d9b8a4836d52eb7ef6257968853a9949b02cde299a05fe7389efab54c59128c"
    ),
    .target(
      name: "GoogleMapsTarget",
      dependencies: ["GoogleMaps"],
      path: "Maps",
      sources: ["GMSEmpty.m"],
      resources: [.copy("Resources/GoogleMapsResources/GoogleMaps.bundle")],
      publicHeadersPath: "Sources",
      linkerSettings: [
        .linkedLibrary("z"),
        .linkedLibrary("c++"),
        .linkedFramework("Accelerate"),
        .linkedFramework("CoreData"),
        .linkedFramework("CoreGraphics"),
        .linkedFramework("CoreImage"),
        .linkedFramework("CoreLocation"),
        .linkedFramework("CoreTelephony"),
        .linkedFramework("CoreText"),
        .linkedFramework("GLKit"),
        .linkedFramework("ImageIO"),
        .linkedFramework("Metal"),
        .linkedFramework("OpenGLES"),
        .linkedFramework("QuartzCore"),
        .linkedFramework("SystemConfiguration"),
        .linkedFramework("UIKit"),
      ]
    ),
    .binaryTarget(
      name: "GoogleMapsCore", url: "https://dl.google.com/geosdk/swiftpm/8.3.1/GoogleMapsCore_3p.xcframework.zip",
      checksum: "31d11bdb0b12bac2bf33e3416c15bd09258a4e193fd8a5ceb452bad281c66626"
    ),
    .target(
      name: "GoogleMapsCoreTarget",
      dependencies: ["GoogleMapsCore"],
      path: "Core",
      sources: ["GMSEmpty.m"],
      publicHeadersPath: "Sources"
    ),
    .binaryTarget(
      name: "GoogleMapsBase", url: "https://dl.google.com/geosdk/swiftpm/8.3.1/GoogleMapsBase_3p.xcframework.zip",
      checksum: "4e865a2f22e393f51546d4095452f4a93e067539a0c48339bb0f579fb5eb163a"
    ),
    .target(
      name: "GoogleMapsBaseTarget",
      dependencies: ["GoogleMapsBase"],
      path: "Base",
      sources: ["GMSEmpty.m"],
      publicHeadersPath: "Sources"
    ),
    .binaryTarget(
      name: "GoogleMapsM4B", url: "https://dl.google.com/geosdk/swiftpm/8.3.1/GoogleMapsM4B_3p.xcframework.zip",
      checksum: "26b92a9e5872f4e6375528fd4b7aa7a8c164a94a31e86e3eca51932cd52be790"
    ),
    .target(
      name: "GoogleMapsM4BTarget",
      dependencies: ["GoogleMapsM4B"],
      path: "M4B",
      sources: ["GMSEmpty.m"],
      publicHeadersPath: "Sources"
    ),
  ]
)
