import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PagesItem extends StatefulWidget {
  final int itemCount;
  final Function(int?) onPageUpdate;

  const PagesItem(
      {Key? key, required this.itemCount, required this.onPageUpdate})
      : super(key: key);
  @override
  PageItemState createState() => PageItemState();
}

class PageItemState extends State<PagesItem> {
  int _currentPage = 1;
  final int _pageSize = 8;

  int _getPageCount() {
    final itemCount = widget.itemCount;
    return (itemCount / _pageSize).ceil();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveValue(
        context,
        defaultValue: 750 * 0.7,
        valueWhen: const [
          Condition.smallerThan(
            name: TABLET,
            value: 600 * 0.7,
          ),
          Condition.largerThan(
            name: TABLET,
            value: 750 * 0.7,
          )
        ],
      ).value,
      //width: 750 * 0.7,
      //height: 1075 * 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: (_currentPage > 1)
                ? () => setState(() {
                      _currentPage--;
                      widget.onPageUpdate(_currentPage);
                    })
                : null,
            icon: const Icon(Icons.arrow_left),
          ),
          ...List.generate(
            _getPageCount() > 7
                ? 7
                : _getPageCount(), // maximum number of pages to display
            (index) {
              // calculate the page number to display
              int pageNumber = 1;
              if (_currentPage <= 4) {
                pageNumber = index + 1;
              } else if (_currentPage >= _getPageCount() - 3) {
                pageNumber = _getPageCount() - 6 + index;
              } else {
                pageNumber = _currentPage - 3 + index;
              }

              return TextButton(
                onPressed: () => setState(() {
                  _currentPage = pageNumber;
                  widget.onPageUpdate(_currentPage);
                }),
                child: Text(
                  '$pageNumber',
                  style: TextStyle(
                    color: (pageNumber == _currentPage)
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              );
            },
          ),
          IconButton(
            onPressed: (_currentPage < _getPageCount())
                ? () => setState(() {
                      _currentPage++;
                      widget.onPageUpdate(_currentPage);
                    })
                : null,
            icon: const Icon(Icons.arrow_right),
          ),
        ],
      ),
    );
  }
}
