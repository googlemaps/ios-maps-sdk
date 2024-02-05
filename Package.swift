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
      name: "GoogleMaps", url: "https://dl.google.com/geosdk/swiftpm/8.4.0/GoogleMaps_3p.xcframework.zip",
      checksum: "65f78e9e4e75be666f26584836791fe5685a43b19d847fe5246d4aeb7146d113"
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
      name: "GoogleMapsCore", url: "https://dl.google.com/geosdk/swiftpm/8.4.0/GoogleMapsCore_3p.xcframework.zip",
      checksum: "c7879ccd3cb20d37816cfbb833adb4965d3fd32253f57b1cf2edc0542611ce70"
    ),
    .target(
      name: "GoogleMapsCoreTarget",
      dependencies: ["GoogleMapsCore"],
      path: "Core",
      sources: ["GMSEmpty.m"],
      publicHeadersPath: "Sources"
    ),
    .binaryTarget(
      name: "GoogleMapsBase", url: "https://dl.google.com/geosdk/swiftpm/8.4.0/GoogleMapsBase_3p.xcframework.zip",
      checksum: "d308fb16e60c6d25b221d485fc1695badceaf8c75069179c75c05614a47cc052"
    ),
    .target(
      name: "GoogleMapsBaseTarget",
      dependencies: ["GoogleMapsBase"],
      path: "Base",
      sources: ["GMSEmpty.m"],
      publicHeadersPath: "Sources"
    ),
    .binaryTarget(
      name: "GoogleMapsM4B", url: "https://dl.google.com/geosdk/swiftpm/8.4.0/GoogleMapsM4B_3p.xcframework.zip",
      checksum: "23665f11fdd498a31fb081d914179e19f2eebdd0366e492f077381748cac21be"
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
