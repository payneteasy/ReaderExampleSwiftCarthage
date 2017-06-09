set -eux

time \
    xcodebuild clean build test \
    -project ReaderExampleSwiftCarthage.xcodeproj \
    -scheme ReaderExampleSwiftCarthage \
    -destination 'platform=iOS Simulator,name=iPhone 6s' \
    | tee xcodebuild.log \
    | xcpretty --report junit
