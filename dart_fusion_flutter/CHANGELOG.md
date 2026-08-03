## 1.0.0
* Create Library
* Create Documentation
* Add License

## 1.1.0
* Add Data Parser
* Make the class abstract and requiring to override `onStart`
* Delete windows, macos, linux, web, android, ios directory to simplify

## 1.2.0
* Add AppImage
* Add AppLog
* Add AppRoute

## 1.3.0
* Add num limiter
* Add AppBuilder
* Add JSON typdef
* Add JSON extension

## 1.4.0
* Add AppButton
* Update AppImage
* Add Context Extension

## 1.5.0
* Update AppButton

## 1.6.0
* Add AppModel

## 1.7.0
* Update AppModel

## 1.8.0
* Add List Extension
* Add AppState Inherited Widget

## 1.9.0
* Add update function (equivalent to setState)

## 2.0.0
* Add ScrollBehavior
* Fix file in AppImage
* Change AppModel to Model

## 2.1.0
* Remove AppImage File

## 2.2.0
* Change context isDesktop from 600.0 to 400.0

## 2.3.0
* Change AppState Widget to Dart Fusion
* Update `typedefs`, `state widget`, `models`, `image`, `log` `extensions`, `button`, `builder` and `behavior`.
* Add `textarea`, `parse`, `overlay` and `cli`.
* Remove `route`.
* Update documentation

## 2.4.0
* Remove api key from localization translator
* Add List fromJSON in model generation
* Update language list

## 2.5.0
* Add `D Exceptions`
* Add parse `FormData` toJSON
* Update `ResponseModel`.
* Update `D Extensions`
* Add `D Service`
* Avoid dart keyword in asset scanner name
* Add generated model of localization to integrate with easy localization
* Add `D Runner`
* Change DartFusion.initialize to DartFusion.runner

## 2.6.0
* Update translate argument in dart_fussion localize defaults to `true`
* Fix length counter in dart_fusion localize percentage
* Add exlucde translations in dart_fusion localize
* Fix runner path doesn't work

## 2.7.0
* Update model class of asset scanner

## 2.8.0
* Remove GoRouter Extension
* Add DLogWidget
* Display scanned image file in doc.
* Add nullable scanner in Model generator
* Add Test model generation in Model generator and DModel
* Add defaultsTo in Variable annotation
* Add conditional import DProcess

## 2.8.1
* Update model updater by adding const
* Update DLogWidget

## 2.8.2
* Undo dimage inlinespan

## 2.8.3
* Add textalign for DButton.text

## 2.8.4
* Remove colorFilter from `DImage`.
* Update `DTextArea`.

## 2.9.0
* Add `DChangeBuilder`
* Add `DTileWrapper`
* Add `DProvider`

## 2.9.1
* Fix `DProvider` context extension

## 3.0.0
* Separate dart and flutter libraries

## 3.0.1
* Split dart and flutter libraries

## 3.1.1
* Update dart_fusion_flutter syntax
* Update dart doc

## 3.1.2
* Update DModel toJSON

## 3.1.3.
* Update middleware
* Add `ResponseAssertion`
* Add CORS validation
* Add toJSON setter in `DModel`
* Add `Header` models
* Update dart doc
* Update readme

## 3.1.4
* Add cors default values,
* Add try parse primitive object from string
* Fix Cors.fromJSON parser
* Update `DMiddleware`
* Update `ResponseAssertion`
* Add `ResponseAssertExtension`
* Update `CORS` handler

## 3.1.5
* Add get random item from list

## 3.1.6
* Update `JSONExtension` of.
* Rename parse in `StringExtension` from prefix `parse` to `to`

## 3.1.7
* Update `DImage` to read base64 image
* Update `JSONExtension` of
* Add `JSONExtension` Unit test

## 3.1.8
* Expose support for passing standard `ImageProvider` directly to `DImage`.
* Support local file paths (absolute/existing paths) passed as string sources.
* Handle case-insensitive image extensions and parse network URLs with query parameters/fragments correctly.
* Inspect `Uint8List` contents dynamically to auto-detect vector (SVG) vs bitmap formats.
* Add beautiful PDF representation fallback card for `.pdf` sources.
* Add widget test suite coverage for `DImage`.