import 'package:flutter/material.dart';

class RowBulider extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final int itemCount;
  const RowBulider({Key? key,
    required this.itemBuilder,
    required this.itemCount,
    this.mainAxisAlignment:MainAxisAlignment.start,
    this.mainAxisSize:MainAxisSize.max,
    this.crossAxisAlignment:CrossAxisAlignment.start,
    this.textDirection,
    this.verticalDirection:VerticalDirection.down,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:List.generate(this.itemCount, (index) => this.itemBuilder(context,index)).toList(),
    );
  }
}


