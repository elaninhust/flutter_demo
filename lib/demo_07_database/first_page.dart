import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/demo_07_database/db/db.dart';
import 'package:flutter_demo/demo_07_database/model/schemas.dart';

const double gap = 20;

const List<Color> colorList = [
  Colors.lightGreen,
  Colors.lightBlue,
  Colors.black,
  Colors.pinkAccent,
  Colors.yellow,
  Colors.blueGrey,
];

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  FocusNode focusNode = FocusNode();

  Color currentColor = colorList.first;

  List<Tag> tagList = [];

  final _tagNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void addData() {
    _tagNameController.clear();
  }

  void getTags() async {
    var result = db.all<Tag>() as List<Tag>;
    setState(() {
      tagList = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('标签管理')),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: gap,
          ),
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(height: gap),
                  SizedBox(
                    height: 40,
                    child: CupertinoTextField(
                      focusNode: focusNode,
                      controller: _tagNameController,
                      clearButtonMode: OverlayVisibilityMode.editing,
                      maxLength: 5,
                      onTapOutside: (event) {
                        focusNode.unfocus();
                      },
                    ),
                  ),
                  const SizedBox(height: gap),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: colorList.map((color) {
                      return ColorTag(
                          color: color,
                          isChecked: color == currentColor,
                          onPress: () {
                            if (currentColor != color) {
                              setState(() {
                                currentColor = color;
                              });
                            }
                          });
                    }).toList(),
                  ),
                  const SizedBox(height: gap),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton.filled(
                      child: const Text('add'),
                      onPressed: () {
                        addData();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: gap),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: ColoredBox(
                    color: Colors.grey.withOpacity(0.2),
                    child: const Center(
                      child: Text('111'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorTag extends StatelessWidget {
  const ColorTag(
      {super.key, required this.color, this.isChecked = false, this.onPress});

  final Color color;

  final bool isChecked;

  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPress != null) {
          onPress!();
        }
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        child: Container(
          color: color.withOpacity(isChecked ? 0.5 : 1),
          width: 30,
          height: 30,
          child: Center(
            child: isChecked
                ? ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(2)),
                    child: Container(
                      width: 10,
                      height: 10,
                      color: Colors.white,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
