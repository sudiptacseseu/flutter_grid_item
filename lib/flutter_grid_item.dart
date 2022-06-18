// Copyright 2022 Sudipta Karmakar. All rights reserved.

/// Flutter widget that arrange items in a grid.
library flutter_grid_item;

import 'package:flutter/material.dart';

/// Grid Item
///
/// {@tool sample}
///
/// This example shows a simple [GridItem].
///
/// ```dart
/// GridItem(
///   onPressed: (dynamic value) {
///     /*...*/
///   },
///   items: [
///     [
///       Grid(title: "1"),
///       Grid(child: Text("2")),
///       Grid(title: "3", flex: 2),
///     ],
///     [
///       Grid(title: "a", value: "100", longPressValue: "long"),
///       Grid(title: "b", color: Colors.lightBlue)
///     ],
///   ],
/// )
/// ```
/// {@end-tool}
///
/// The [items] and [onPressed] arguments must not be null.
class GridItem extends StatefulWidget {
  /// Defines the appearance of the button items that are 2D arrayed within the GridItem.
  final List<List<Grid>> items;

  /// Called when the button is tapped or otherwise activated.
  final ValueChanged<dynamic> onPressed;

  /// The color to use when painting the line.
  final Color? borderColor;

  /// Width of the divider border, which is usually 1.0.
  final double borderWidth;

  /// Whether to show surrounding borders.
  final bool hideSurroundingBorder;

  /// The text style to use for all grids in the [GridItem].
  /// [Grid.textStyle] of each item takes precedence.
  final TextStyle? textStyle;

  /// Determine the layout order
  final TextDirection? textDirection;

  /// ui control disabled
  final bool enabled;

  const GridItem(
      {Key? key,
      required this.items,
      required this.onPressed,
      this.borderColor,
      this.textStyle,
      this.textDirection,
      this.borderWidth = 1.0,
      this.hideSurroundingBorder = false,
      this.enabled = true})
      : super(key: key);

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  late BorderSide _borderSide;

  Widget _getItem(int row, int col) {
    Grid item = widget.items[col][row];
    TextStyle? textStyle = item.textStyle ?? widget.textStyle;
    var noBottomLine =
        widget.hideSurroundingBorder && widget.items.length == col + 1;
    var noRightLine =
        widget.hideSurroundingBorder && widget.items[col].length == row + 1;
    return Expanded(
      flex: item.flex,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: noBottomLine ? BorderSide.none : _borderSide,
            right: noRightLine ? BorderSide.none : _borderSide,
          ),
        ),
        child: TextButton(
          key: item.key,
          style: TextButton.styleFrom(
            primary: textStyle?.color,
            backgroundColor: item.color,
            textStyle: textStyle,
            shape: item.shape ??
                RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
          ),
          onPressed: (widget.enabled == true)
              ? () {
                  widget.onPressed(item.value ?? item.title);
                }
              : null,
          onLongPress: (widget.enabled == true)
              ? () {
                  var result = item.longPressValue ?? item.value;
                  widget.onPressed(result ?? item.title);
                }
              : null,
          child: item.child == null
              ? Text(
                  item.title!,
                  style: textStyle,
                )
              : item.child!,
        ),
      ),
    );
  }

  List<Widget> _getRows(int col) => [
        for (int i = 0; i < widget.items[col].length; i++) _getItem(i, col),
      ];

  List<Widget> _getCols() => [
        for (int i = 0; i < widget.items.length; i++)
          Expanded(
            child: Row(
              textDirection: widget.textDirection,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _getRows(i),
            ),
          )
      ];

  @override
  Widget build(BuildContext context) {
    _borderSide = Divider.createBorderSide(context,
        color: widget.borderColor, width: widget.borderWidth);
    return Container(
      decoration: widget.hideSurroundingBorder
          ? null
          : BoxDecoration(
              border: Border(
                top: _borderSide,
                left: _borderSide,
              ),
            ),
      child: Column(
        children: _getCols(),
      ),
    );
  }
}

/// The data for a cell of a [GridItem].
class Grid {
  /// The [key] for the button.
  final Key? key;

  /// The item's fill color.
  final Color? color;

  /// The item's label.
  final Widget? child;

  /// The text to display on the button.
  final String? title;

  /// If non-null, the style to use for button's text.
  final TextStyle? textStyle;

  /// The flex factor to use for the button.
  final int flex;

  /// The value for the [GridItem.onPressed] callback parameter.
  /// If the [value] is null, the callback will use the [title] instead.
  final dynamic value;

  /// The value for the [GridItem.onPressed] callback parameter.
  /// If the [longPressValue] is null, the callback will fallback to
  /// the [value] set for [GridItem.onPressed] if [value] is null
  /// the callback will use the [title] instead.
  final dynamic longPressValue;

  /// Border and shape settings
  final OutlinedBorder? shape;

  const Grid({
    this.key,
    this.title,
    this.color,
    this.textStyle,
    this.value,
    this.longPressValue,
    this.flex = 1,
    this.child,
    this.shape,
  });
}
