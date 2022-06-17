import 'package:flutter/material.dart';
import 'package:flutter_grid_item/flutter_grid_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('widget test', (WidgetTester tester) async {
    var keyA = UniqueKey();
    var keyB = UniqueKey();
    var value;
    var gridItem = GridItem(
      onPressed: (dynamic val) {
        value = val;
      },
      items: [
        [
          Grid(title: "a", key: keyA),
          Grid(title: "b", key: keyB, value: 100),
          const Grid(title: "c"),
        ],
        const [Grid(title: "d")],
        const [
          Grid(title: "e"),
          Grid(title: "f"),
          Grid(title: "g"),
          Grid(title: "h")
        ],
      ],
    );
    var app = MaterialApp(
      home: gridItem,
    );
    await tester.pumpWidget(app);
    await tester.tap(find.byKey(keyA));
    expect(value, equals("a"));
    await tester.tap(find.byKey(keyB));
    expect(value, equals(100));
  });
}
