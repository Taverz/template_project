import 'package:flutter/material.dart';
import 'package:ui_kit/common/colors_app.dart';

class CountProductElementList {
  static Widget active({
    required String title,
    required double price,
    required Function() countPlus,
    required Function() countMinus,
    required Function() onDelete,
    required Function() onChangePrice,
  }) =>
      _CountProductElementList(
        title: title,
        price: price,
        countPlus: countPlus,
        countMinus: countMinus,
        onDelete: onDelete,
        onChangePrice: onChangePrice,
      );

  static Widget error() => const _CountProductElementListError();
}

class _CountProductElementListError extends StatelessWidget {
  const _CountProductElementListError();

  @override
  Widget build(BuildContext context) {
    return const Text('Error');
  }
}

class _CountProductElementList extends StatefulWidget
    implements CountProductElementList {
  final String title;
  final double price;
  final Function() countPlus;
  final Function() countMinus;
  final Function() onDelete;
  final Function() onChangePrice;

  const _CountProductElementList({
    required this.title,
    required this.price,
    required this.countPlus,
    required this.countMinus,
    required this.onDelete,
    required this.onChangePrice,
  });

  @override
  createState() => _ProductListItemState();
}

class _ProductListItemState extends State<_CountProductElementList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int _count = 0;
  bool _isDetailedView = false;

  void _increment() {
    setState(() {
      _count++;
    });
    widget.countPlus();
  }

  void _decrement() {
    if (_count > 0) {
      setState(() {
        _count--;
      });
      widget.countMinus();
    }
  }

  void _toggleView() {
    setState(() {
      _isDetailedView = !_isDetailedView;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0),
      child: GestureDetector(
        onTap: _toggleView,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          decoration: BoxDecoration(
            color: _isDetailedView
                ? Colors.blue.shade100
                : ColorsApp.colorsApp.whiteSimple,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        _isDetailedView
                            ? '$_count * ${widget.price.round()} = ${(_count * widget.price.toInt()).round()}'
                            : '${(_count * widget.price.toInt()).round()}',
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.add_circle_outline_outlined,
                          color: ColorsApp.colorsApp.green,
                        ),
                        onPressed: _increment,
                      ),
                      Text(
                        '$_count',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.remove_circle_outline_outlined,
                          color: ColorsApp.colorsApp.red,
                        ),
                        onPressed: _decrement,
                      ),
                    ],
                  ),
                ],
              ),
              if (_isDetailedView)
                Column(
                  children: [
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: _TextButton(
                            text: 'Удалить из счета',
                            color: ColorsApp.colorsApp.red,
                            onTap: widget.onDelete,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: _TextButton(
                            text: 'Изменить цену',
                            color: ColorsApp.colorsApp.greyBlue,
                            onTap: widget.onChangePrice,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  const _TextButton({
    required this.text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8.0),
            splashColor: ColorsApp.colorsApp.white24,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: ColorsApp.colorsApp.whiteSimple,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
