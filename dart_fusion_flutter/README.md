<a name="dart-fusion-logo"></a>
<p align="center">
  <img src="https://user-images.githubusercontent.com/45191605/267848544-e316c985-3369-4609-9aa5-6becfdb9bee8.png" alt="Dart Fusion Logo" width="150">
</p>

# Dart Fusion
A library that brings together a harmonious blend of essential tools, utilities, and components designed to supercharge my Dart projects.

## Table of Contents
- [Dart Fusion](#dart-fusion-logo)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Documentation](#documentation)
- [Dart Fusion CLI](#dart-fusion-cli-logo)
  - [Asset Scanner](#dart-fusion-cli-asset)
  - [Model Updater](#dart-fusion-cli-model)
  - [Localization Translator](#dart-fusion-cli-localization)
- [D Annotations](#d-annotation-logo)
  - [Model](#d-annotation-model)
  - [Variable](#d-annotation-variable)
- [D Assertions](#d-assertions)
  - [Assert](#d-assertion-assert)
  - [Response Assert](#d-assertion-response)
- [D Behavior](#d-behavior)
- [D Builder](#d-builder)
- [D Exceptions](#d-exceptions)
  - [Type Exception](#d-exception-type)
  - [Response Exception](#d-exception-response)
- [D Extensions](#d-extensions-logo)
  - [Number Extension](#d-extensions-number)
    - [Min](#d-extensions-number-min)
    - [Max](#d-extensions-number-max)
    - [Limit](#d-extensions-number-limit)
  - [Integer](#d-extensions-integer)
  - [JSON Extension](#d-extensions-json)
    - [Merge](#d-extensions-json-merge)
    - [Of](#d-extensions-json-of)
    - [Maybe of](#d-extensions-json-maybe-of)
  - [BuildContext Extension](#d-extensions-build-context)
    - [Theme](#d-extensions-build-context-theme)
    - [Color](#d-extensions-build-context-color)
    - [Text](#d-extensions-build-context-text)
    - [Query](#d-extensions-build-context-query)
    - [Size](#d-extensions-build-context-size)
    - [Height](#d-extensions-build-context-height)
    - [Width](#d-extensions-build-context-width)
    - [Is Phone](#d-extensions-build-context-isphone)
    - [Is Desktop](#d-extensions-build-context-isdesktop)
    - [Is Tablet](#d-extensions-build-context-istablet)
  - [RequestContext Extension](#d-extensions-request-context)
    - [Method](#d-extensions-request-context-method)
    - [Is Get](#d-extensions-request-context-isget)
    - [Is Post](#d-extensions-request-context-ispost)
    - [Is Put](#d-extensions-request-context-isput)
    - [Is Delete](#d-extensions-request-context-isdelete)
    - [Is WebSocket](#d-extensions-request-context-iswebsocket)
    - [Parameter](#d-extensions-request-context-parameter)
    - [Header](#d-extensions-request-context-header)
    - [JWT Verify](#d-extensions-request-context-verify)
  - [List Extension](#d-extensions-list)
    - [To](#d-extensions-list-to)
    - [Limit](#d-extensions-list-limit)
    - [DModel List](#d-extensions-list-dmodel)
  - [String Extension](#d-extensions-string)
- [D Image](#d-image)
- [D Log](#d-log)
- [D Models](#d-models)
  - [D Model](#d-model-model)
  - [Link Model](#d-model-link)
  - [Response Model](#d-model-response)
- [D Overlay](#d-overlay)
- [D Parse](#d-parse)
  - [HTTP Method Message](#d-parse-http-method-message)
  - [HTTP Status Message](#d-parse-http-status-message)
  - [Exception Message](#d-parse-exception-message)
- [D Runner](#d-runner)
- [D Services](#d-services)
  - [Middleware](#d-service-middleware)
  - [Cors](#d-service-cors)
  - [Header](#d-service-header)
  - [Random ID](#d-service-random-id)
- [D Typedefs](#d-typedefs)
- [D Widget](#d-widget-logo)
  - [Key Features](#d-widget-key-features)
  - [Usage](#d-widget-usage)
- [D Change Builder](#d-change-builder)
- [D Provider](#d-provider)
- [D Tile Wrapper](#d-tile-wrapper)
 
## Installation
put this in your pubspec.yaml
```yaml
dependencies:
  dart_fusion:
    git:
      url: https://github.com/Nialixus/dart_fusion.git
      path: dart_fusion
      ref: v3.1.8

  # or import this one instead for flutter project
  
  dart_fusion_flutter:
    git:
      url: https://github.com/Nialixus/dart_fusion.git
      path: dart_fusion_flutter
      ref: v3.1.8
```

also run this command in terminal
```bash
dart pub global activate --source git https://github.com/Nialixus/dart_fusion.git
```
---
<a name="dart-fusion-cli-logo"></a>
<p align="center">
  <img src="https://github.com/Nialixus/dart_fusion/assets/45191605/88e37aee-5e2d-4589-ae08-59069c936338" alt="Dart Fusion CLI Logo" width="150">
</p>

# Dart Fusion CLI
The Dart Fusion CLI is a command-line tool that provides a set of utilities to simplifies common tasks such as asset generation, model updates, and localization.

> [!NOTE]
> This also can be achieved using [DRunner](#d-runner)

## <a name="dart-fusion-cli-usage"></a> Usage
- **Asset Generation** <a name="dart-fusion-cli-asset"></a>: Easily generate asset classes from asset directories, making it simple to access assets in your Dart project. To scan asset files and generate them into one dart class, run this command
  
  ```bash
  dart run dart_fusion asset
  ```

  And this is the list of available commands.
  | OPTION        | DESCRIPTION                                         |
  | ------------- | --------------------------------------------------- |
  | -i, --input   | Input directory of where assets took place.         |
  |               | default to `assets`                                 |
  | -o, --output  | Output file of generated asset class.               |
  |               | default to `lib/src/assets.dart`                    |
  | -h, --help    | Print this usage information.                       |

- **Model Updates** <a name="dart-fusion-cli-model"></a>: Update models by generating toJSON, fromJSON and copyWith based on given annotation. To update these models, run this command
  ```bash
  dart run dart_fusion model
  ```

  And this is the available commands.
  | OPTION         | DESCRIPTION                             |
  | -------------- | --------------------------------------- |
  | -i, --input    | Input directory of the models.          |
  |                | default to `""`                         |
  | -h, --help     | Print this usage information.           |

- **Localization** <a name="dart-fusion-cli-localization"></a>: Generate localization classes from JSON files, simplifying the process of managing free translations in your Dart applications.
  ```bash
  dart run dart_fusion localize
  ```

  List of the commands
  | OPTION        | DESCRIPTION                                                    |
  | ------------- | -------------------------------------------------------------- |
  | -i, --input   | Input directory of where the JSON base translation took place. |
  |               | default to `assets/translation/en.json`                        |
  | -o, --output  | Generating `JSON` to easy_localization model                   |
  | --from        | Base language used for translation                             |
  |               | default to `en`                                                |
  | --to          | Targeted translation languages                                 |
  |               | default to `["af","sq","am","ar","hy","as","ay","az","bm","eu","be","bn","bho","bs","bg","ca","ceb","zh-CN","zh","zh-TW","co","hr","cs","da","dv","doi","nl","en","eo","et","ee","fil","fi","fr","fy","gl","ka","de","el","gn","gu","ht","ha","haw","he","hi","hmn","hu","is","ig","ilo","id","ga","it","ja","jv","kn","kk","km","rw","gom","ko","kri","ku","ckb","ky","lo","la","lv","ln","lt","lg","lb","mk","mai","mg","ms","ml","mt","mi","mr","mni-Mtei","lus","mn","my","ne","no","ny","or","om","ps","fa","pl","pt","pa","qu","ro","ru","sm","sa","gd","nso","sr","st","sn","sd","si","sk","sl","so","es","su","sw","sv","tl","tg","ta","tt","te","th","ti","ts","tr","tk","ak","uk","ur","ug","uz","vi","cy","xh","yi","yo","zu"]`
  | -h, --help    | Print this usage information.                                  |

---

<a name="d-annotation-logo"></a>
<p align="center">
  <img src="https://user-images.githubusercontent.com/45191605/267885292-129bc9a7-3b33-4b03-9926-079f12a28775.png" alt="D Annotation Logo" width="150">
</p>

# D Annotations
D Annotations is a set of class used as an indicator for `Dart Fusion CLI` model generation

## <a name="d-annotations-usage"></a> Usage
<a name="d-annotation-model"></a>
- **Model**: Annotation of class as an indicator to generate a `fromJSON`, `toJSON` and `copyWith` inside the annotated class.
  ```dart
  @model
  class MyClass extends DModel {}

  // or you can annotate it like this

  @Model(immutable: true, copyWith: true, fromJSON: true, toJSON: true)
  class MyClass extends DModel {}
  ```
<a name="d-annotation-variable"></a>
- **Variable**: Annotation of variable inside a model class with `@Model` annotation.
  ```dart
  @variable
  final DModel value;
  
  // or you can annotate it like this
  
  @Variable(name: 'd_model', toJSON: true, fromJSON: true)
  final DModel value;
  ```

  And when you run
  ```bash
  dart run dart_fusion model
  ```

  This will resulting something like this
  ```dart
  @model
  class MyClass extends DModel {
    const MyClass({required this.title, required this.value});
    
    @Variable(name: 'd_model', toJSON: true, fromJSON: true)
    final DModel value;

    @variable
    final String title;

    @override
    MyClass copyWith({DModel? value, String? title}) {
      return MyClass(
        value: value ?? this.value,
        title: title ?? this.title,
      );
    }

    @override
    JSON get toJSON => {
      'd_model': value.toJSON,
      'title': title,
    };

    static MyClass fromJSON(JSON value){
      return MyClass(
        value: DModel.fromJSON(value.of<JSON>('d_model'),
        title: value.of<String>('title'))
      );
    }
  }
  ```
---

# D Assertions
D Assertion is a set of assertion class used for performing assertions and validations.

<a name="d-assertion-assert"></a>
- **Assert**: The `Assert` class facilitates assertion checks based on boolean conditions. If the assertion fails, it throws an `Exception` with a provided message.
  
  ```dart
  int number = 1;
  Assert(
    number.isEven, // conditional needed in assertion checker
    'Number is not even!', // message if the conditional return false
  );
  ```
<a name="d-assertion-response"></a>
- **Response**: A specialized `Assert` class for handling response-related assertions.
  ```dart
  return (context) {
    final method = context.request.method;

    Assert.response(
      method == HttpMethod.post, // assertion checker
      'Invalid Method!', // message if the conditional return false
      statusCode: 405, // status code to send inside `ResponseException`
    );
  }
  ```

---

# D Behavior
D Behavior is a custom scroll behavior for controlling the scrolling physics of scrollable widgets.

## <a name="d-behavior-usage"></a> Usage
```dart
ScrollConfiguration(
  behavior: DBehavior(
    physics: BouncingScrollPhysics()),
  child: ListView(),
);
```
---

# D Builder
D Builder is a widget that builds its child using a custom builder function with optional data.

## <a name="d-builder-usage"></a> Usage
```dart
DBuilder(
  data: {"name": "John", "age": 30},
  builder: (context, data) {
    final name = data.of<String>("name");
    final age = data.of<int>("age");
    return Text("My name is $name and I am $age years old.");
  },
)
```
---

# D Exceptions
D Exceptions is a set of exception class used in this library.

<a name="d-exception-type"></a>
- **Type Exception**: An exception caused by failing to parse `Type`.
  
  ```dart
  throw TypeException(
    message: 'Type is not available',
    );
  ```
<a name="d-exception-response"></a>
- **Response Exception**: An exception containing `Response` value.
  ```dart
  throw ResponseException(
      response: Response(
        statusCode: 404,
      )
    );
  ```

---

<a name="d-extensions-logo"></a>
<p align="center">
  <img src="https://user-images.githubusercontent.com/45191605/268232865-208b24c8-141f-437c-bbb6-72168acf3981.png" alt="D Extensions Logo" width="250">
</p>

# D Extensions
An extension collection of mostly used function in flutter project.
## <a name="d-extensions-number"></a> Number Extension
Extension on numeric types (int, double) to add utility methods for limiting values within a specified range.
  - <a name="d-extensions-number-min"></a> **Min** : Limit the minimum number of the extended value.
    ```dart
    int min = 5.min(10);
    print(min); // 10
    ```
  - <a name="d-extensions-number-max"></a> **Max** : Limit the maximum number of the extended value.
    ```dart
    double max = 100.0.max(10.0);
    print(max); // 10.0
    ```
  - <a name="d-extensions-number-limit"></a> **Limit** : Limit number of the extended value in a certain range.
    ```dart
    int number = 75.limit(0, 100);
    print(number); // 75
    ```

## <a name="d-extensions-integer"></a> Integer Extension
Converts integer to a human-readable string representing bytes.
```dart
int bytes = 1048576;
String parse = bytes.toReadableBytes;
print(parse); // "1048.57 KB"
```

## <a name="d-extensions-json"></a> JSON Extension
Extension on the Map<String, dynamic> value.
  - <a name="d-extensions-json-merge"></a> **Merge** : Merging one `JSON` to another.
    ```dart
    JSON json = {"primary": "1", "secondary": "2"};
    JSON anotherJSON = {"primary": "10", "tertiary": "3"};
    print(json.merge(anotherJSON)); // {"primary": "10", "secondary": "2", "tertiary": "3"}
    ```
  - <a name="d-extensions-json-of"></a> **Of** : Parse `dynamic` value in `JSON` to given `Object` with an optional `onError` fallback.
    ```dart
    JSON value = {"primary": "1"};
    String primary = value.of<String>("primary");
    print(primary); // "1"
    String secondary = value.of<String>("secondary", "No Data");
    print(secondary); // "No Data"
    ```
  - <a name="d-extensions-json-maybe-of"></a> **Maybe of** : Parse `dynamic` value in `JSON` to given nullable `Object`.
    ```dart
    JSON value = {"primary": "1"};
    String? primary = value.maybeOf<String>("primary");
    print(primary); // "1"
    String? secondary = value.maybeOf<String>("secondary");
    print(secondary); // null
    ```
## <a name="d-extensions-build-context"></a> BuildContext Extension
A set of extension collection on `BuildContext`.
  - <a name="d-extensions-build-context-theme"></a> **Theme** : A shortcut for calling `Theme.of(context)`.
    ```dart
    ThemeData theme = context.theme;
    ```
  - <a name="d-extensions-build-context-color"></a> **Color** : A shortcut for calling `Theme.of(context).colorScheme`.
    ```dart
    ColorScheme color = context.color;
    ```
  - <a name="d-extensions-build-context-text"></a> **Text** : A shortcut for calling `Theme.of(context).textTheme`.
    ```dart
    TextTheme text = context.text;
    ```
  - <a name="d-extensions-build-context-query"></a> **Query** : A shortcut for calling `MediaQuery.of(context)`.
    ```dart
    MediaQuery query = context.query;
    ```
  - <a name="d-extensions-build-context-size"></a> **Size** : A shortcut for calling `MediaQuery.sizeOf(context)`.
    ```dart
    Size suze = context.querySize;
    ```
  - <a name="d-extensions-build-context-width"></a> **Width** : A shortcut for calling `MediaQuery.sizeOf(context).width`.
    ```dart
    double width = context.width;
    ```
  - <a name="d-extensions-build-context-height"></a> **Height** : A shortcut for calling `MediaQuery.sizeOf(context).height`.
    ```dart
    double height = context.height;
    ```
  - <a name="d-extensions-build-context-isphone"></a> **Is Phone** : To check wether the screen width less than `400 px` or not.
    ```dart
    bool isPhone = context.isPhone;
    ```
  - <a name="d-extensions-build-context-isdesktop"></a> **Is Desktop** : To check wether the screen width more than `700 px` or not.
    ```dart
    bool isDesktop = context.isDesktop;
    ```
  - <a name="d-extensions-build-context-istablet"></a> **Is Tablet** : To check wether the screen width less than `400 px` and more than `700 px` or not.
    ```dart
    bool isTablet = context.isTablet;
    ```
## <a name="d-extensions-request-context"></a> RequestContext Extension
A set of extension collection on `RequestContext`.
  - <a name="d-extensions-request-context-method"></a> **Method** : A shortcut to get `HttpMethod` out of `RequestContext`.
    ```dart
    HttpMethod method = context.method;
    ```
  - <a name="d-extensions-request-context-isget"></a> **Is Get** : Check whether request method is `HttpMethod.get` or not.
    ```dart
    bool isGET = context.isGET;
    ```
  - <a name="d-extensions-request-context-ispost"></a> **Is Post** : Check whether request method is `HttpMethod.post` or not.
    ```dart
    bool isPOST = context.isPOST;
    ```
  - <a name="d-extensions-request-context-isput"></a> **Is Put** : Check whether request method is `HttpMethod.put` or not.
    ```dart
    bool isPUT = context.isPUT;
    ```
  - <a name="d-extensions-request-context-isdelete"></a> **Is Delete** : Check whether request method is `HttpMethod.delete` or not.
    ```dart
    bool isDELETE = context.isDELETE;
    ```
  - <a name="d-extensions-request-context-iswebsocket"></a> **Is Web Socket** : Check whether request method is a http request or websocket request.
    ```dart
    bool isWS = context.isWebSocket;
    ```
 - <a name="d-extensions-request-context-parameter"></a> **Parameter** : A shortcut to get parameter from `RequestContext`.
    ```dart
    JSON parameter = context.parameter;
    ```
 - <a name="d-extensions-request-context-header"></a> **Header** : A shortcut to get header from `RequestContext`.
    ```dart
    JSON parameter = context.parameter;
    ```
 - <a name="d-extensions-request-context-verify"></a> **JWT Verify** : A function to verify `JWT` Bearer Token.
    ```dart
    JWT jwt = await context.verify((key) => Env.read<String>(key));
    ```
## <a name="d-extensions-list"></a> List Extension
A set of extension collection on `BuildContext`.
  - <a name="d-extensions-list-to"></a> **To** : Generate key index and value of its items.
    ```dart
    List<String> texts = ["one", "two", "three"];
    List<Widget> widgets = texts.to((index, item) => Text("$index: $item"));
    ```
  - <a name="d-extensions-list-limit"></a> **Limit** : Safely limitting list on certain length.
    ```dart
    List<int> integers = [1, 2, 3];
    List<int> sublist = integers.limit(1, 100);
    print(sublist); // [2, 3]
    ```
## <a name="d-extensions-list-dmodel"></a> DModel List Extension
Extending list of `DModel` to get its toJSON values.
```dart
List<DModel> dmodels = [DModel(), DModel()];
List<JSON> jsons = dmodels.toJSON;
```
## <a name="d-extensions-string"></a> String Extension
Capitalizing the first letter of `String`s.
```dart
String word = 'magnificent'.capitalize;
print(word); // Magnificent
```
---

# D Image
A widget for displaying vector or bitmap images from different sources.

## <a name="d-image-usage"></a> Usage
```dart
// Vector / Bitmap image from file
DImage(source: File('path/to/images.svg'))

// Vector / Bitmap image from asset
DImage(source: 'assets/image/image.png');

// Vector / Bitmap image from Uint8List
DImage(source: Uint8List());

// Vector / Bitmap image from network
DImage(source: 'http://image.dom/asset.svg');
```
---

# D Log
A simple logging utility for printing log messages with customizable log levels.

## <a name="d-log-usage"></a> Usage
```dart
Exception e = Exception('something');
DLog(e); // Exception: something
```
---

# D Models
A collection of `DModel` models.

<a name="d-model-model"></a>
- **D Model**: Base dart model which consist `copyWith`, `toJSON`, `fromJSON` and `toString` value.
  
  ```dart
  class MyModel extends DModel {
    @override
    MyModel copyWith() {
      return MyModel();
    }
  
    static MyModel fromJSON(JSON value) {
      return MyModel();
    }
  
    @override
    JSON get toJSON {
      return {};
    }
  }
  ```
<a name="d-model-response"></a>
- **Response Model**: Basic model in root of every `Response`, containing `success` status, `message` and also `data` that extends `DModel` class.

  ```dart
  ResponseModel(
    success: true,
    message: 'Successfully Fetching Data!',
    data: const ResponseDataModel());
  ```
<a name="d-model-link"></a>
- **Link Model**: Link reference used in `ResponseModel` to indicate the relationship of resources.
  ```dart
  LinkModel(
    method: HttpMethod.get,
    description: 'Read User Detail',
    reference: '/user/123');
  ```
---

# D Overlay
A builder widget that displays an overlay.

## <a name="d-overlay-usage"></a> Usage
```dart
final overlay = DOverlay(builder: (context, progress, controller) => YourWidget());

GestureDetector(
  onTap: () {
    overlay.controller.display(context);
  }
);
```

# D Parse
A utility class for parsing mostly related to http request.
- <a name="d-parse-http-method-message"></a> **HTTP Method Message** : Parsing message of http method value like `DELETE`, `GET`, `HEAD`, `OPTIONS`, `PATCH`, `POST` or `PUT`.
  ```dart
  HttpMethod method = HttpMethod.get;
  final message = DParse.httpMethodMessage(method.name);
  print(message); // 'Data successfully loaded'
  ```
- <a name="d-parse-http-status-message"></a> **HTTP Status Message** : Parsing message of `statusCode` value in [Response].
  ```dart
  Response response = Response(...);
  final message = DParse.httpStatusMessage(response.statusCode);
  print(message); // 'Not Found: The requested resource could not be found'
  ```
- <a name="d-parse-exception-message"></a> **Exception Message** : Parsing error message from [Exception].
  ```dart
  FormatException exception = FormatException('Unexpected end of input (at character 1)');
  final message = DParse.exceptionMessage(exception);
  print(message); // 'Data is not exist'
  ```
---

# D Runner
Runner class for `Dart Fusion CLI'.
- <a name="d-runner-asset"></a> **Asset Runner** : Runner to scan asset and turn it into one model class.
- <a name="d-runner-model"></a> **Model Runner** : Runner to completing `DModel`, like `copyWith`, `fromJSON` and `toJSON`.
- <a name="d-runner-localization"></a> **Localization Runner** : Runner to translate `Locale` and generate a model to be integrated with `easy_localization`.

## <a name="d-runner-usage"></a> Usage
Set this in your root main.dart
> **File:** `main.dart`
> 
> ```dart
> void main() {
>   WidgetsFlutterBinding.ensureInitialized();
>   DartFusion.runner(const [AssetRunner(), ModelRunner(), LocalizeRunner()]);
>   runApp(...);
> }
> ```

---

# D Services
A set of service collection mosty used in dart backend.

## <a name="d-service-middleware"></a> MiddleWare
Middleware for handling requests and responses in `Dart Frog`. This middleware supports both regular HTTP requests and websockets.
> **File:** `_middleware.dart`
> 
> ```dart
> Handler middleware(Handler handler) {
>   return DService.middleware(
>     handler: handler,
>     certificate: (key) => Env.read(key)!,
>     data: ResponseDataModel.fromJSON,
>   );
> }
> ```

## <a name="d-service-cors"></a> Cors
Configuration class for defining Cross-Origin Resource Sharing (CORS) policies in a Dart backend application.
> **File:** `_middleware.dart`
> 
> ```dart
> Handler middleware(Handler handler) {
>   return handler.use(
>     Cors(
>       accessControlAllowOrigin: ['*'],
>       accessControlAllowMethods: [HttpMethod.get, HttpMethod.post],
>       accessControlAllowHeaders: [Header.contentType, Header.authorization],
>       accessControlAllowCredentials: false,
>       accessControlExposeHeaders: [Header.date],
>       accessControlMaxAge: Duration(hours: 24)
>     ).handler,
>   );
> }
> ```

## <a name="d-service-header"></a> Header
Abstract class representing headers used in CORS policies. It has 98 child class extending this class.
```dart
Header header = ContentType();
print(header); // 'Content-Type'
```

## <a name="d-service-random-id"></a> Random ID
Generate simple random key identifier
```dart
String id = DService.randomID();
```

---

# D Typedefs
A set of mostly used typedefs in dart.

| Typedef | Original             | 
| ------- | -------------------- |
| JSON    | Map<String, dynamic> | 

---

<a name="d-widget-logo"></a>
<p align="center">
  <img src="https://user-images.githubusercontent.com/45191605/268439850-08b6133c-1585-4853-8e99-c3fc7abef447.png" alt="D Widget Logo" width="150">
</p>

# D Widget
Offers a solution to simplify the boilerplate code commonly associated with using StatefulWidget. By providing a clean and efficient approach, it enhances the developer experience. Designed with convenience and simplicity in mind, AppStateWidget streamlines the development process, allowing you to focus on building intuitive user interfaces without getting bogged down by repetitive code.

## <a name="d-widget-key-features"></a> Key Features
* Reduce Boilerplate
  With DWidget, you can significantly reduce boilerplate code when working with StatefulWidget. Say goodbye to excessive code blocks and welcome concise, elegant declarations.
* Improved Readability
  By abstracting away common patterns, the library ensures cleaner and more readable code, making it easier to comprehend and maintain your project.
* Easy to Use
  Implementing DWidget is straightforward. Just extend the class, override specific methods like onStart, onPreparation, onFinish, and let the magic happen.
* Data Passing Made Simple
  With a convenient data method, you can easily declare and pass data between the widget and its state, ensuring your data management is both efficient and organized.

## <a name="d-widget-usage"></a> Usage
To use it, you're going to need extending this class like this

```dart
class MyClass extends DWidget {
  const MyClass({super.key});

  @override
  Map<String, dynamic> data(DState state){
    return {'controller': TextEditingController()};
  }

  @override
  void onPreparation(DState state){
    state.value<TextEditingController>('controller').text = 'Loading';
  }

  @override
  Widget onStart(DState state){
    return TextField(controller: state.value<TextEditingController>('controller'));
  }

  void onReady(DState state){
    state.value<TextEditingController>('controller').text = 'Data Loaded';
  }

  @override
  void onFinish(DState state){
    state.value<TextEditingController>('controller').dispose();
  }
}
```

and you can also get [DState] in its child, by calling this

```dart
DInherited.of(context);
```

or get the data in [DState] with this

```dart
context.value<TextEditingController>("controller");
```

also to cell setState we change it to
```dart
state.update();
```
---

# D Change Builder
A widget that listens to changes in a `ChangeNotifier` and rebuilds its child widgets based on the changes.

## <a name="d-change-builder-usage"></a> Usage
```dart
final changeNotifier = ScrollController();

return DChangeBuilder(
  value: changeNotifier,
  builder: (context, value, child) {
    /* Your code here */
  },
  child: AnotherWidget(),
);
```

---

# D Provider
A generic InheritedWidget for providing an object to its descendants.

## <a name="d-provider-usage"></a> Usage
This is to set the value
```dart
DProvider<MyData>(
  value: 'Test',
  child: MyWidget(),
);
```

and this way to get the value
```dart
var value = context.provider.value;
print(value); // 'Test'
```

---

# D Tile Wrapper
A wrapper around `ExpansionTile` to listen changes of its state.

## <a name="d-tile-wrapper-usage"></a> Usage
```dart
DTileWrapper((isExpanded) {
  return ExpansionTile(...);
});
```

---

## Documentation
For dart doc generated document, you can see it in this

- [Dart Fusion](https://raw.githack.com/Nialixus/dart_fusion/main/dart_fusion/doc/api/index.html "Dart Fusion Documentation")
- [Dart Fusion Flutter](https://raw.githack.com/Nialixus/dart_fusion/main/dart_fusion_flutter/doc/api/index.html "Dart Fusion Flutter Documentation")
