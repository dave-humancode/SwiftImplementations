#  SwiftImplementations

Simple demonstration of types implemented in Swift, and bridged to Objective-C
using custom headers.

Open the `SwiftImplementations.xcodeproj` project in Xcode, and build the
documentation in the `SwiftImplementations` target to read detailed
instructions.

## Overview

This project contains demonstrations of a technique to expose types implemented
in Swift to Objective-C using hand-written headers.

The technique will generate documentation files that properly alias the Swift
and Objective-C symbols, and allow the reader to switch between Swift and
Objective-C views of the symbols without switching documentation pages.

The heavy lifting is contained in the `Defines.h` header file. Through the use
of the macros defined there, you can expose functions, classes, categories
(extensions), protocols, and simple enumerations implemented in Swift using
Objective-C headers.

### Only top-level symbols are supported

Only symbols defined at the top level of the module can be bridged. Nested types
fail to bridge (may be a bug or incomplete feature implementation?).

### Automatic header generation must be disabled

The technique shown in this sample requires manually-created header files
instead of relying on the automatically-generated `-Swift.h` header. Automatic
header generation must be disabled to prevent duplicate declarations.

Disable automatic header generation by setting `SWIFT_INSTALL_OBJC_HEADER = NO`
in an `xcconfig` file assigned to your target, or by setting “Install
Objective-C Compatibility Header” to `No` in your target’s build settings.

### Only compatible symbols may be exposed to Objective-C

Only methods and types compatible with Objective-C can be exposed in
Objective-C headers. You may create helper methods, computed properties, or
functions to provide a compatible interface for an incompatible one. For
classes, mark these helper methods or computed properties `private` to hide them
from Swift users of your code.

### Classes exposed to Objective-C cannot be subclassed

Classes exposed using this technique cannot be subclassed in Objective-C (the
Swift class can be subclassed in Swift if it’s declared `open`). Further, many
of the Objective-C tricks involving message manipulation will not work. If you
are interested in producing a fully compatible Objective-C class implemented in
Swift, follow [this pitch](https://forums.swift.org/t/pitch-objective-c-implementations-in-swift/61907)
on the Swift forums.
