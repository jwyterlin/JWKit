# JWKit
JWKit is a kit with some helper classes to speed up the development of an iOS project

In this kit you will find some classes that may be useful to solve small problems or needs
which usually occur when we are developing an application for the iOS platform.

If you want to only use those classes using these resources come from a static library, just do the following
steps:

- Clean the project with 'Cmd + Option + Shift + K', and select 'Clean'.
- Build with the target JWKit selected.
- Clicking the right button on libJWKit.a that is in the 'Products' folder and select 'Show in Finder'.
- To implement the library in your project, just copy the 'include' folder and the libJWKit.a file to your project.

This library is already universally adapted for all architectures, including applications to run in the iOS Simulator.

To make it easier, you can create a framework: 

- Compile the project with the target 'Framework' selected.
- As an addendum, a copy of the framework will be created on your desktop, so you can already copy it and paste it in
your project.

## Classes in the kit

The public classes are:

- ArrayHelper

  For now, has only methods that return arrays of Brazilian states.

- BinarySearchTree

  It is a popular implementation of the data structure, binary tree search in Objective-C.

- CellHelper

  This is a helper to create cells with dynamic heights.

- Database

  A full class for working with data persistence using CoreData.

- DateHelper

  Many methods to manipulate NSDate.

- DeviceInfo

  Some features to assist in obtaining information about the device.

- JWMacros

  Macros, because macros are cool.

- NSMutableArray+Helper

  A helper to enable copy all objects from a NSMutableArray to other.

- Routes

  A structure to work with routes of webservices.

- StringHelper

  Many methods to validate and manipulate NSStrings.

- Validator

  As the name implies, used to validate the integrity of objects, strings and array of objects.
