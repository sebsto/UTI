# Uti

A small utility allowing to change the default handler for macOS's UTI.

It allows to force opening `.webloc` files with the browser of your choice on macOS Ventura 13.1 by changing the `com.apple.web-internet-location` UTI handler.

It requires to modify the code to suit your needs. Read the comments in the code :-) 

## Usage 

- change code to use your browser bundle id
- Type `swift run`  

## Prerequisites

- You must have the swift toolchain installed on your system (just install Apple's Xcode)
- Use [xcodeinstall](https://github.com/sebsto/xcodeinstall) to install Xcode from the command line.

## Notes 

This code relies on macOS [Launch Services API](https://developer.apple.com/documentation/coreservices/launch_services), which are deprecated. This code might stop working on future macOS version.
