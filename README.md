# Example of using PaynetEasyReader library to integrate Miura or Spire mPOS

[![Build Status](https://travis-ci.org/payneteasy/ReaderExampleSwiftCarthage.svg?branch=master)](https://travis-ci.org/payneteasy/ReaderExampleSwiftCarthage)

## How to build this project

#### Set up the project dependencies

```
carthage update --platform iOS
```

#### Open project

open ReaderExampleSwiftCarthage.xcodeproj

## How to integrate the SDK to your swift project

* Create `Cartfile` and add the following line to itЖ
```
github "payneteasy/PaynetEasyReader" "0.2.31-3"
```
* Run `carthage update --platform iOS`
* Run `open your-project.xcodeproj`
* On your application targets’ “General” settings tab, in the “Linked Frameworks and Libraries” section add the following frameworks:
```
Carthage/Build/iOS/BerTlv.framework
Carthage/Build/iOS/OMGHTTPURLRQ.framework
Carthage/Build/iOS/PaynetEasyReader.framework
Carthage/Build/iOS/RemoteLogger.framework
Carthage/Build/iOS/TDOAuth.framework
```
* On your application targets’ “Build Phases” settings tab, click the “+” icon and choose “New Run Script Phase”. Create a Run Script in which you specify your shell (ex: `/bin/sh`), add the following contents to the script area below the shell:

```sh
/usr/local/bin/carthage copy-frameworks
```

and add the paths to the frameworks you want to use under “Input Files”, e.g.:

```
$(SRCROOT)/Carthage/Build/iOS/BerTlv.framework
$(SRCROOT)/Carthage/Build/iOS/OMGHTTPURLRQ.framework
$(SRCROOT)/Carthage/Build/iOS/PaynetEasyReader.framework
$(SRCROOT)/Carthage/Build/iOS/RemoteLogger.framework
$(SRCROOT)/Carthage/Build/iOS/TDOAuth.framework
```
  
* Add *Bridging-Header.h* file to your project
```obj-c
#ifndef Bridging_Header_h
#define Bridging_Header_h


#import <PaynetEasyReader/PNEReaderFactory.h>
#import <PaynetEasyReader/PNEReaderInfo.h>
#import <PaynetEasyReader/PNEReaderManager.h>
#import <PaynetEasyReader/PNEReaderPresenter.h>
#import <PaynetEasyReader/PNEProcessingEvent.h>
#import <PaynetEasyReader/PNEProcessingContinuation.h>
#import <PaynetEasyReader/PNECard.h>
#import <PaynetEasyReader/PNECardError.h>
#import <PaynetEasyReader/PNEReaderEvent.h>
#import <PaynetEasyReader/PNEConfigurationContinuation.h>
#import <PaynetEasyReader/PNEConfigurationContinuationBuilder.h>

#endif /* Bridging_Header_h */
```

* Drug the *Bridging-Header.h* file to *Build Settings / Objective-C Bridging Header*
* Add to your *-Info.plist
```xml
<key>UISupportedExternalAccessoryProtocols</key>
<array>
  <string>com.miura.shuttle</string>
  <string>com.thyron</string>
</array>
```
