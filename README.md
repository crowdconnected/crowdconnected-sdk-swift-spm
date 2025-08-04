# Crowd Connected SDK for iOS

A Swift Package Manager (SPM) distribution of the Crowd Connected iOS SDK, providing indoor positioning, location services, and Bluetooth functionality for iOS applications.

## Overview

The Crowd Connected SDK enables precise indoor positioning and location services using a combination of technologies including Bluetooth beacons, WiFi, and sensor fusion. This package provides pre-compiled XCFrameworks that support both device and simulator architectures.

## Features

- **Indoor Positioning System (IPS)**: High-accuracy indoor location tracking
- **Core Location Services**: Fundamental location and positioning capabilities
- **Bluetooth Integration**: Bluetooth beacon scanning and proximity detection
- **Geolocation Services**: Enhanced GPS and outdoor positioning
- **Shared Utilities**: Common functionality shared across all modules

## Requirements

- iOS 14.0+
- Xcode 15.0+
- Swift 6.1+

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/crowdconnected/crowd-connected-sdk-swift-spm.git", from: "1.0.0")
]
```

Or add it through Xcode:

1. Open your project in Xcode
2. Go to **File** → **Add Package Dependencies**
3. Enter the repository URL: `https://github.com/crowdconnected/crowd-connected-sdk-swift-spm.git`
4. Select the version and add the desired target dependencies

## Available Modules

The SDK is divided into several modules that can be imported independently:

### CrowdConnectedCore
The main SDK module providing core functionality and services.

```swift
import CrowdConnectedCore
```

### CrowdConnectedIPS
Indoor Positioning System capabilities for precise indoor location tracking.

```swift
import CrowdConnectedIPS
```

### CrowdConnectedGeo
Enhanced geolocation services and outdoor positioning features.

```swift
import CrowdConnectedGeo
```

### CrowdConnectedCoreBluetooth
Bluetooth functionality including beacon scanning and proximity detection.

```swift
import CrowdConnectedCoreBluetooth
```

### CrowdConnectedShared
Shared utilities and common functionality used across other modules.

```swift
import CrowdConnectedShared
```

## Usage

### Using Multiple Modules

```swift
import CrowdConnectedShared
import CrowdConnectedCore
import CrowdConnectedIPS
import CrowdConnectedCoreBluetooth
import CrowdConnectedGeo

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        CrowdConnectedIPS.activate()
        CrowdConnectedGeo.activate()
        CrowdConnectedCoreBluetooth.activate()

        CrowdConnected.shared.activateSDKBackgroundRefresh()
        startSDK()

        return true
    }

func startSDK() {
    if sdkAppKey.isEmpty || sdkToken.isEmpty || sdkSecret.isEmpty {
        return
    }

    let credentials = SDKCredentials(appKey: sdkAppKey, token: sdkToken, secret: sdkSecret)

    CrowdConnected.shared.start(
        credentials: credentials,
        trackingMode: sdkTrackingMode.locationTrackingMode
    ) { deviceID, validationResult in
        guard case .success = validationResult else {
            // SDK start had failed with a config validation error.
            print(validationResult.description)
            return
        }

        self.sdkDeviceId = deviceID ?? "unknown"
        print("#DEBUG: SDK started successfully with device ID \(self.sdkDeviceId)")
    }
}
```

## Privacy

This SDK respects user privacy and follows Apple's privacy guidelines. The package includes privacy manifests (`PrivacyInfo.xcprivacy`) that declare:

- **Data Collection**: No personal data is collected by default
- **API Usage**: Uses UserDefaults API for configuration storage
- **Tracking**: No tracking domains are used

## Architecture Support

The XCFrameworks included in this package support:

- **iOS Device**: arm64 architecture
- **iOS Simulator**: arm64 and x86_64 architectures

This ensures compatibility with both Apple Silicon and Intel-based development machines.

## Documentation

For detailed documentation, API references, and integration guides, please visit:

- [Crowd Connected Developer Portal](https://developers.crowdconnected.com/)
- [API Documentation](https://docs.crowdconnected.com/)

## Support

For technical support, questions, or issues:

- **Email**: support@crowdconnected.com
- **Documentation**: [Developer Portal](https://developers.crowdconnected.com/)
- **Issues**: Please report issues through the GitHub repository

## License

This SDK is proprietary software owned by Crowd Connected Ltd. Please refer to your license agreement or contact Crowd Connected for licensing terms.

## About Crowd Connected

Crowd Connected provides enterprise-grade indoor positioning and location intelligence solutions. Our technology enables businesses to understand and optimize the movement of people and assets in indoor environments.

---

For more information about Crowd Connected and our solutions, visit [crowdconnected.com](https://www.crowdconnected.com).
