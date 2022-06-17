# flutter_grid_item

Flutter widget that arrange items in a grid. It is useful for making a number pad, calculator, and so on.

[![pub package](https://img.shields.io/pub/v/flutter_grid_item.svg)](https://pub.dartlang.org/packages/flutter_grid_item)

<img src="https://github.com/sudiptacseseu/flutter_grid_item/blob/master/example/screenshot.png?raw=true" width="320px"/>


## Getting Started

To use this plugin, add `flutter_grid_item` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

```yaml
dependencies:
 flutter_grid_item: 
```

Import the library in your file.

````dart
import 'package:flutter_grid_item/flutter_grid_item.dart';
````

See the `example` directory for a complete sample app using GridItem.
Or use the GridItem like below.

````dart
GridItem(
  onPressed: (String value) {
    /*...*/
  },
  items: [
    [
      Grid(title: "1"),
      Grid(child: Text("2")),
      Grid(title: "3", flex: 2),
    ],
    [
      Grid(title: "a", value: "100", longPressValue: "long"),
      Grid(title: "b", color: Colors.lightBlue)
    ],
  ],
)
````