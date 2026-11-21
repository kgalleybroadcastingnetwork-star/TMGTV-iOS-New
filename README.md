# TMG TV — iOS starter project

This project reuses the original HTML, CSS, JavaScript, channel artwork and external stream embeds extracted from the supplied Android AAB. It is an **iOS source project**, not a signed IPA.

## Requirements
- Mac with a recent Xcode version and iOS 15+ SDK
- XcodeGen (`brew install xcodegen`)
- Apple developer signing credentials for installation/distribution

## Build
1. Copy this entire folder onto your Mac.
2. Open Terminal, `cd` into this folder and run `xcodegen generate`.
3. Open `TMGTV.xcodeproj` in Xcode.
4. In target **TMGTV > Signing & Capabilities**, select your Apple development team and choose a unique bundle identifier if needed.
5. Select an iPhone simulator or connected iPhone, then press Run.
6. Test both TV players and all three radio players on a physical device. They depend on external sites and may restrict embedding, autoplay, or playback.
7. To distribute, select **Any iOS Device**, choose **Product > Archive**, then use **Distribute App** for App Store Connect/TestFlight. Apple signing and App Store review are required.

## Notes
- The five stream embeds are unchanged from the Android bundle. Availability and rights to rebroadcast are **not verified**.
- App Store review may reject apps that are merely repackaged websites without sufficient native value. Consider adding native navigation, favorites, playback and accessibility before submission.
- This starter does not implement AdMob. The Android bundle's web assets do not establish a complete iOS advertising implementation. If ads are added, follow Apple's privacy and consent requirements.
- The App Store requires appropriate app icons, screenshots, privacy disclosures and permissions/rights for content.
- The `NSAllowsArbitraryLoadsInWebContent` setting is intended to support embedded third-party content; review and restrict network security exceptions before release.
