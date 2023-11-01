import 'package:flutter/material.dart';
void main() {
  runApp(DragAndDropApp());
}
class DragAndDropApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DragAndDropScreen(),
    );
  }
}
class DragAndDropScreen extends StatefulWidget {
  @override
  _DragAndDropScreenState createState() => _DragAndDropScreenState();
}
class _DragAndDropScreenState extends State<DragAndDropScreen> {
  List<Color> filledContainers = [Colors.red, Colors.blue, Colors.green];
  List<Color> hollowContainers = [Colors.white, Colors.white, Colors.white];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Draggable<Color>(
            data: Colors.red,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: filledContainers[0],
                ),
              ],
            ),
            feedback: Container(
              width: 100,
              height: 100,
              color: filledContainers[0].withOpacity(0.5),
            ),
            childWhenDragging: Container(),
          ),
          Draggable<Color>(
            data: Colors.blue,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: filledContainers[1],
                ),
              ],
            ),
            feedback: Container(
              width: 100,
              height: 100,
              color: filledContainers[1].withOpacity(0.5),
            ),
            childWhenDragging: Container(),
          ),
          Draggable<Color>(
            data: Colors.green,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: filledContainers[2],
                ),
              ],
            ),
            feedback: Container(
              width: 100,
              height: 100,
              color: filledContainers[2].withOpacity(0.5),
            ),
            childWhenDragging: Container(),
          ),
          DragTarget<Color>(
            builder: (context, candidateData, rejectedData) {
              return Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: hollowContainers[0],
                    child: Center(child: Text('Red')),
                  ),
                ],
              );
            },
            onAccept: (color) {
              setState(() {
                hollowContainers[0] = color;
                // filledContainers.remove(color);
              });
            },
            onWillAccept: (color) => color == Colors.red,
          ),
          DragTarget<Color>(
            builder: (context, candidateData, rejectedData) {
              return Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: hollowContainers[1],
                    child: Center(child: Text('Blue')),
                  ),
                ],
              );
            },
            onAccept: (color) {
              setState(() {
                hollowContainers[1] = color;
                //filledContainers.remove(color);
              });
            },
            onWillAccept: (color) => color == Colors.blue,
          ),
          DragTarget<Color>(
            builder: (context, candidateData, rejectedData) {
              return Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: hollowContainers[2],
                    child: Center(child: Text('Green')),
                  ),
                ],
              );
            },
            onAccept: (color) {
              setState(() {
                hollowContainers[2] = color;
                //filledContainers.remove(color);
              });
            },
            onWillAccept: (color) => color == Colors.green,
          ),
        ],
      ),
    );
  }
}


