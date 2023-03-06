//
//  Defines.h
//  SwiftImplementations
//
//  Created by Dave Rahardja on 3/5/23.
//

// Declares a symbol as implemented in Swift. Use this for functions and
// categories.
//
// Usage: HUMN_IMPLEMENTED_IN_SWIFT(module) <declaration>
#define HUMN_IMPLEMENTED_IN_SWIFT(_module) \
__attribute__((external_source_symbol(language="Swift", defined_in=#_module, generated_declaration)))

// Declares an Objective-C class as implemented in Swift.
//
// Usage: HUMN_CLASS_IMPLEMENTED_IN_SWIFT(swiftname, module) <declaration>
#define HUMN_CLASS_IMPLEMENTED_IN_SWIFT(_swift_name, _module) \
__attribute__((swift_name(#_swift_name))) \
HUMN_IMPLEMENTED_IN_SWIFT(_module)

// Declares an enumeration available to Objective-C analagous to a Swift
// enumeration.
//
// Usage: typedef HUMN_ENUM_IMPLEMENTED_IN_SWIFT(Type, Name, SwiftName, Module) { ... };
#define HUMN_ENUM_IMPLEMENTED_IN_SWIFT(_type, _name, _swift_name, _module) \
enum _name : _type _name __attribute__((swift_name(#_swift_name))); \
enum __attribute__((swift_name(#_swift_name))) \
HUMN_IMPLEMENTED_IN_SWIFT(_module) \
_name: _type
