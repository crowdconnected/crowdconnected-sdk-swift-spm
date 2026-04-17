# Crowd Connected SDK for iOS

A Swift Package Manager (SPM) distribution of the Crowd Connected iOS SDK, providing indoor positioning, geolocation, and Bluetooth beacon functionality for iOS applications.

## Requirements

- iOS 14.0+
- Xcode 26.3+
- Swift 6.2+

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/crowdconnected/crowdconnected-sdk-swift-spm.git", from: "3.0.1")
]
```

Or add it through Xcode:

1. Open your project in Xcode
2. Go to **File** → **Add Package Dependencies**
3. Enter the repository URL: `https://github.com/crowdconnected/crowdconnected-sdk-swift-spm.git`
4. Select version `3.0.1` or later
5. Add the desired product(s) to your target

## Available Products

The SDK exposes three products. Add only the ones your app needs.

### CrowdConnectedGeo
Enhanced geolocation and outdoor positioning services.

```swift
// In Package.swift target dependencies:
.product(name: "CrowdConnectedGeo", package: "crowdconnected-sdk-swift-spm")
```

### CrowdConnectedIPS
Indoor Positioning System for precise indoor location tracking.

```swift
// In Package.swift target dependencies:
.product(name: "CrowdConnectedIPS", package: "crowdconnected-sdk-swift-spm")
```

### EddystonePlugin
Bluetooth beacon scanning and Eddystone proximity detection. Requires IPS to function.

```swift
// In Package.swift target dependencies:
.product(name: "CrowdConnectedCoreBluetooth", package: "crowdconnected-sdk-swift-spm")
```

## Usage

### Starting the SDK

Build a `Configuration` using the Builder pattern, assign a delegate, then call `start(with:)`:

```swift
import CrowdConnectedCore

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let configuration = Configuration.Builder()
            .withCredentials(
                appKey: "YOUR_APP_KEY",
                clientId: "YOUR_CLIENT_ID",
                clientSecret: "YOUR_CLIENT_SECRET"
            )
            .with(modules: [.geo, .ips])   // add .coreBluetooth for EddystonePlugin
            .with(trackingMode: .background)
            .build()

        CrowdConnected.shared.delegate = self
        CrowdConnected.shared.start(with: configuration)

        return true
    }
}
```

### Handling Delegate Callbacks

```swift
extension AppDelegate: CrowdConnectedDelegate {

    func locationProvider(_ crowdConnected: CrowdConnected, didStartSuccess deviceId: String) {
        print("SDK started — device ID: \(deviceId)")
    }

    func locationProvider(_ crowdConnected: CrowdConnected, didStartFailure errorCode: ErrorCode) {
        print("SDK failed to start: \(errorCode.description)")
    }

    func locationProvider(_ crowdConnected: CrowdConnected, didUpdateLocation location: Location) {
        print("Location: \(location.latitude), \(location.longitude)")
    }
}
```

### Stopping the SDK

```swift
CrowdConnected.shared.stop()
```

## Architecture Support

All XCFrameworks support:

- **iOS Device**: arm64
- **iOS Simulator**: arm64 and x86_64

## Privacy

Each module includes a `PrivacyInfo.xcprivacy` manifest declaring API usage in accordance with Apple's privacy requirements.

## Documentation

- [Integration Guide](https://docs.crowdconnected.com)
- [Crowd Connected Portal](https://app.crowdconnected.com)

## Support

- **Email**: support@crowdconnected.com
- **Issues**: Please report via the GitHub repository

## License

Proprietary software owned by Crowd Connected Ltd. Please refer to your license agreement or contact Crowd Connected for licensing terms.
