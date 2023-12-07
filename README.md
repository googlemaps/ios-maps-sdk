# Google Maps SDK For iOS Swift package

## Description

This repository contains the Swift package for the Maps SDK for iOS. For
additional methods of installing the Maps SDK for iOS including CocoaPods, see
the Maps SDK for iOS
[documentation](https://developers.google.com/maps/documentation/ios-sdk/config).

## Requirements

-   [Xcode](https://developer.apple.com/xcode/) version 14.0 or later
-   An app targeting iOS 14 or later
-   A Google Maps Platform
    [project](https://developers.google.com/maps/documentation/ios-sdk/cloud-setup)
    with the Maps SDK for iOS enabled.
-   An
    [API key](https://developers.google.com/maps/documentation/ios-sdk/get-api-key)
    associated with the project above.

## Installation

1.  Follow the instructions for
    [adding package dependencies to your app in Xcode](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app).

2.  In the "Enter Package URL" field, enter this GitHub repository:

    ```
    https://github.com/googlemaps/ios-maps-sdk
    ```

3.  Select the
    [version](https://developers.google.com/maps/documentation/ios-sdk/versions)
    of the Maps SDK for iOS that you want to use. For new projects, we recommend
    specifying the latest version and using the "Up to Next Major Version"
    option.

4.  Follow the
    [instructions](https://developers.google.com/maps/documentation/ios-sdk/config#get-key)
    to add your API key to your app.

Alternatively, you can add the following to the `dependencies` value of your
`Package.swift` file:

```
dependencies: [
  .package(
    url: "https://github.com/googlemaps/ios-maps-sdk.git",
    .upToNextMajor(from: "8.3.0")
  )
]
```

## Sample App

See samples demonstrating use of the Maps SDK for iOS on
[developers.google.com](https://developers.google.com/maps/documentation/ios-sdk/code-samples)
or on [GitHub](https://github.com/googlemaps-samples/maps-sdk-for-ios-samples).

## Documentation

Documentation for the Maps SDK for iOS is available as
[guides](https://developers.google.com/maps/documentation/ios-sdk/) and
[reference documentation](https://developers.google.com/maps/documentation/ios-sdk/reference).

## Contributing

External contributions are not accepted for this repository.

## Terms of Service

This library uses Google Maps Platform services, and any use of Google Maps
Platform is subject to the
[Terms of Service](https://cloud.google.com/maps-platform/terms).

## Support

If you find a bug, or have a feature request, please
[file an issue](https://developers.google.com/maps/documentation/ios-sdk/support#issue-tracker)
on the Maps SDK for iOS issue tracker or
[open a support case](https://developers.google.com/maps/documentation/ios-sdk/support#contact-maps-support).

You can also discuss this library with other developers on our
[Discord server](https://discord.gg/hYsWbmk).
