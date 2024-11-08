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
      url: "https://dl.google.com/geosdk/swiftpm/9.2.0/GoogleMaps_3p.xcframework.zip",
      checksum: "5632e9be780ef979611e3256c13c5fd4bfc594b4b949cb34c7a48a8192bc3225"
    ),
    .target(
      name: "GoogleMapsTarget",
      dependencies: ["GoogleMaps"],
      path: "Maps",
      sources: ["GMSEmpty.m"],
      resources: [.copy("Resources/GoogleMapsResources/GoogleMaps.bundle")],
      publicHeadersPath: "Sources",
      linkerSettings: [
        .linkedLibrary("c++"),
        .linkedLibrary("z"),
        .linkedFramework("Accelerate"),
        .linkedFramework("Contacts"),
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
        .linkedFramework("Security"),
        .linkedFramework("SystemConfiguration"),
        .linkedFramework("UIKit"),
      ]
    ),
  ]
)
