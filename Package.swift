// swift-tools-version: 5.5
//
// Copyright 2024 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "GoogleMaps", platforms: [.iOS(.v15)],
  products: [.library(name: "GoogleMaps", targets: ["GoogleMapsTarget"])], dependencies: [],
  targets: [
    .binaryTarget(
      name: "GoogleMaps",
      url: "https://dl.google.com/geosdk/swiftpm/9.1.1/GoogleMaps_3p.xcframework.zip",
      checksum: "0b8235f8fbd7642c3fc597ae56610ce7d62b3ec8558bb3d8e04ac736147e0b8d"
    ),
    .target(
      name: "GoogleMapsTarget",
      dependencies: [
        "GoogleMaps",
        "GoogleMapsBaseTarget",
        "GoogleMapsCoreTarget",
      ],
      path: "Maps",
      sources: ["GMSEmpty.m"],
      resources: [.copy("Resources/GoogleMapsResources/GoogleMaps.bundle")],
      publicHeadersPath: "Sources",
      linkerSettings: [
        .linkedFramework("Accelerate"),
        .linkedFramework("CoreImage"),
        .linkedFramework("CoreText"),
        .linkedFramework("GLKit"),
        .linkedFramework("ImageIO"),
        .linkedFramework("Metal"),
        .linkedFramework("OpenGLES"),
        .linkedFramework("QuartzCore"),
      ]
    ),
    .binaryTarget(
      name: "GoogleMapsCore",
      url: "https://dl.google.com/geosdk/swiftpm/9.1.1/GoogleMapsCore_3p.xcframework.zip",
      checksum: "17edee7a31ad5deee06bf09eda7a4105528a26e19e61027be8300922031ce359"
    ),
    .target(
      name: "GoogleMapsCoreTarget",
      dependencies: ["GoogleMapsCore"],
      path: "Core",
      sources: ["GMSEmpty.m"],
      publicHeadersPath: "Sources"
    ),
    .binaryTarget(
      name: "GoogleMapsBase",
      url: "https://dl.google.com/geosdk/swiftpm/9.1.1/GoogleMapsBase_3p.xcframework.zip",
      checksum: "3234fe695929fe6716ffd8c825f804453ef0883b277fe6a5cecd38cf86ac662a"
    ),
    .target(
      name: "GoogleMapsBaseTarget",
      dependencies: ["GoogleMapsBase"],
      path: "Base",
      sources: ["GMSEmpty.m"],
      publicHeadersPath: "Sources",
      linkerSettings: [
        .linkedLibrary("c++"),
        .linkedLibrary("z"),
        .linkedFramework("Contacts"),
        .linkedFramework("CoreData"),
        .linkedFramework("CoreGraphics"),
        .linkedFramework("CoreLocation"),
        .linkedFramework("CoreTelephony"),
        .linkedFramework("QuartzCore"),
        .linkedFramework("SystemConfiguration"),
        .linkedFramework("UIKit"),
      ]
    ),
  ]
)
