import 'package:flutter/material.dart';

class TicTacToeGame extends StatefulWidget {
  const TicTacToeGame({Key? key}) : super(key: key);

  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  late List<List<String>> grid;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    grid = List.generate(3, (_) => List.filled(3, ''));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  void _onTap(int row, int col) {
    setState(() {
      if (grid[row][col] == '') {
        grid[row][col] = 'X';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 348,
      height: 348,
      child: GridView.count(
        controller: _scrollController, // Add ScrollController to GridView
        physics:
            const NeverScrollableScrollPhysics(), // Add ScrollPhysics to disable bouncing effect
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        children: List.generate(9, (index) {
          final row = index ~/ 3;
          final col = index % 3;
          return GestureDetector(
            onTap: () => _onTap(row, col),
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 6.0, color: Colors.blue),
                  bottom: BorderSide(width: 6.0, color: Colors.blue),
                  left: BorderSide(width: 6.0, color: Colors.blue),
                  right: BorderSide(width: 6.0, color: Colors.blue),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
