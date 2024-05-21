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
  name: "GoogleMaps", platforms: [.iOS(.v15)],
  products: [.library(name: "GoogleMaps", targets: ["Maps"])], dependencies: [],
  targets: [
    .binaryTarget(
      name: "GoogleMaps",
      url: "https://dl.google.com/geosdk/swiftpm/9.0.0/GoogleMaps_3p.xcframework.zip",
      checksum: "997a67052607339e379a46d281ee4d198c6448f59176ff03e0a5da5bb315cd14"
    ),
    .target(
      name: "Maps",
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
      url: "https://dl.google.com/geosdk/swiftpm/9.0.0/GoogleMapsCore_3p.xcframework.zip",
      checksum: "290f4002db479331d18fb9233e3015a1eb0d9abc16a765648e60590f34b0d691"
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
      url: "https://dl.google.com/geosdk/swiftpm/9.0.0/GoogleMapsBase_3p.xcframework.zip",
      checksum: "de00cb1d8557ee90a2fa7dd73060d74ddaf28d6d137082d6df147535b5eb4a01"
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
