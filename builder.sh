rm -rf build

# For iOS Device
xcodebuild archive \
-scheme test-algorithm \
-configuration Release \
-destination 'generic/platform=iOS' \
-archivePath './build/test-algorithm.framework-iphoneos.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# For Simulators
xcodebuild archive \
-scheme test-algorithm \
-configuration Release \
-destination 'generic/platform=iOS Simulator' \
-archivePath './build/test-algorithm.framework-iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Create XCFramework
xcodebuild -create-xcframework \
 -framework './build/test-algorithm.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/test_algorithm.framework' \
-framework './build/test-algorithm.framework-iphoneos.xcarchive/Products/Library/Frameworks/test_algorithm.framework' \
-output './build/test-algorithm.xcframework'
