# ``SwiftImplementations``

Simple demonstration of types implemented in Swift, and bridged to Objective-C
using custom headers.

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

### Only compatible symbols may be visible from Objective-C

Only methods and types compatible with Objective-C can be exposed in
Objective-C headers. Create helper methods, computed properties, or functions to
expose a compatible interface. For classes, mark these helper methods or
computed properties `private` to hide them Swift users of your code.

### Classes exposed to Objective-C cannot be subclassed

Classes exposed using this technique cannot be subclassed. Further, many of the
Objective-C tricks involving message manipulation will not work. If you are
interested in producing a fully compatible Objective-C class implemented in
Swift, follow [this pitch](https://forums.swift.org/t/pitch-objective-c-implementations-in-swift/61907)
on the Swift forums.

### Instructions

#### Functions

To expose a function written in Swift to Objective-C, follow these steps:

- Create a header file with a function declaration that reflects the interface
  of the swift function.
- Prefix the interface with ``HUMN_IMPLEMENTED_IN_SWIFT``, passing in the name
  of the module where the implementation resides.
- In Swift, prefix the function with `@_cdecl()`, passing in the Objective-C
  name of the function.

Note that the Objective-C version of the function will also be visible to Swift
users of your code. I’m not aware of a way to hide it at this moment.

#### Classes

To expose a class or category written in Swift to Objective-C, follow these
steps:

- Create a header file with an Objective-C interface that reflects the 
  interface of the Swift class.
- Prefix the interface with ``HUMN_CLASS_IMPLEMENTED_IN_SWIFT``, passing in
  the Swift name of the class, and the module it appears in.
- In Swift, prefix the class with `@objc()`, passing in the name of the class
  as it appears in the Objective-C header.
- Ensure the Swift class inherits from `NSObject`.
- For each property or method that appears in the header, decorate each item’s
  implementation with `@objc()`, passing in the name of the symbol as it appears
  in the header if different from the automatically-generated name.

To create a method or property that is visible _only_ to Objective-C users of
the class, declare the method normally in the header, but declare its
implementation `private` in Swift.

#### Categories

To expose an Swift extension to a class as an Objective-C category, follow these
steps. The class being extended must already be visible from Objective-C.

- Create a header file with an Objective-C category that reflects the Swift
  implementation
- Prefix the interface with ``HUMN_IMPLEMENTED_IN_SWIFT``, passing in the name
  of the module where the implementation resides.
- In Swift, prefix the extension with `@objc()`.
- For each property or method that appears in the header, decorate each item’s
  implementation with `@objc()`, passing in the name of the symbol as it appears
  in the header if different from the automatically-generated name.

#### Protocols

To expose a protocol written in Swift to Objective-C, follow these steps:

- Create a header file with an Objective-C protocol that reflects the Swift
  protocol.
- Prefix the interface with ``HUMN_PROTOCOL_IMPLEMENTED_IN_SWIFT``, passing in
  the Swift name of the protocol, and the module it appears in.
- In Swift, prefix the protocol with `@objc()`, passing in the name of the
  protocol as it appears on the Objective-C header.
- For each property or method that appears in the header, decorate each item’s
  implementation with `@objc()`, passing in the name of the symbol as it appears
  in the header if different from the automatically-generated name.

#### Enumerations

To expose an enumeration written in Swift to Objective-C, follow these steps:

- Ensure that the Swift enumeration inherits from a scalar type, such as `Int`.
- Prefix the Swift enumeration with `@objc()`, passing in the name of the
  enumeration as it will appear on the Objective-C header.
- Create an Objective-C header declaring the enumeration using the
  ``HUMN_ENUM_IMPLEMENTED_IN_SWIFT`` macro. Use the following pattern:
```objc
typedef HUMN_ENUM_IMPLEMENTED_IN_SWIFT(Type, ObjC_name, Swift_name, Module) {
  // ... 
};
```

`Type` is the scalar type used in the Swift implementation.

Declare each enumeration (and its value, if needed) within the curly brackets.
