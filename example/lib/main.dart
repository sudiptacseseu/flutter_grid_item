import 'package:flutter/material.dart';
import 'package:flutter_grid_item/flutter_grid_item.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 26);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('GridItem'),
        ),
        body: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridItem(
              textStyle: textStyle,
              borderColor: Colors.white,
              borderWidth: 4,
              onPressed: (dynamic val) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(val.toString()),
                    duration: const Duration(milliseconds: 400),
                  ),
                );
              },
              items: [
                [
                  Grid(
                      child: const Icon(
                        Icons.image_outlined,
                        size: 50,
                      ),
                      textStyle: textStyle.copyWith(color: Colors.white),
                      value: 'image',
                      color: Colors.blue,
                      shape: BorderSide(width: 4, color: Colors.blue.shade600),
                      borderRadius: 10)
                ],
                [
                  Grid(
                    title: "Grey",
                    color: Colors.grey,
                    textStyle: textStyle.copyWith(color: Colors.white),
                  ),
                  Grid(
                    title: "Green",
                    color: Colors.green,
                    textStyle: textStyle.copyWith(color: Colors.white),
                  ),
                ],
                [
                  const Grid(title: "7"),
                  const Grid(title: "8"),
                  const Grid(title: "9"),
                  Grid(title: "×", color: Colors.grey[300]),
                ],
                [
                  const Grid(title: "4"),
                  const Grid(title: "5"),
                  const Grid(title: "6"),
                  Grid(title: "-", color: Colors.grey[300]),
                ],
                [
                  const Grid(title: "1"),
                  const Grid(title: "2"),
                  const Grid(title: "3"),
                  Grid(title: "+", color: Colors.grey[300]),
                ],
                [
                  const Grid(title: "0"),
                  const Grid(title: "000", flex: 2, longPressValue: 400),
                  Grid(title: "=", color: Colors.grey[300]),
                ],
              ],
            ),
          );
        }),
      ),
    );
  }
}
