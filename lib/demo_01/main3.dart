import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart';

void main() => runApp(const CupertinoScaffoldExample());

class CupertinoScaffoldExample extends StatefulWidget {
  const CupertinoScaffoldExample({super.key});

  @override
  State<StatefulWidget> createState() => _CupertinoScaffoldExampleState();
}

class _CupertinoScaffoldExampleState extends State<CupertinoScaffoldExample> {
  static const endString = '--正在加载--';
  final _controller = ScrollController();
  var showBackToTopButton = false;
  var dataList = [_CupertinoScaffoldExampleState.endString];

  @override
  void initState() {
    super.initState();
    _getMoreData();

    _controller.addListener(() {
      const showButtonHeight = 1000;

      if (_controller.offset < showButtonHeight && showBackToTopButton) {
        _toggleBackToTopButtonStatus(false);
      } else if (_controller.offset >= showButtonHeight &&
          !showBackToTopButton) {
        _toggleBackToTopButtonStatus(true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _getMoreData() {
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
      () {
        setState(() {
          dataList.insertAll(
            dataList.length - 1,
            generateWordPairs().take(10).map((e) => e.asPascalCase).toList(),
          );
        });
      },
    );
  }

  _toggleBackToTopButtonStatus(bool status) {
    setState(() {
      showBackToTopButton = status;
    });
  }

  _handleBackToTop() {
    _controller.animateTo(
      0.0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('ListView'),
        ),
        child: Stack(
          children: [
            Scrollbar(
              controller: _controller,
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  print(
                      '${notification.metrics.minScrollExtent.toInt()}-${notification.metrics.maxScrollExtent.toInt()}-${notification.metrics.pixels.toInt()}-${(notification.metrics.pixels / notification.metrics.maxScrollExtent * 100).toInt()}');
                  return false;
                },
                child: ListView.separated(
                  controller: _controller,
                  itemBuilder: (_, index) {
                    if (dataList.elementAt(index) ==
                        _CupertinoScaffoldExampleState.endString) {
                      if (dataList.length < 101) {
                        _getMoreData();
                        return SizedBox(
                          height: 40,
                          child: Center(
                              child: Text(
                            dataList.elementAt(index),
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.withOpacity(0.6),
                            ),
                          )),
                        );
                      } else {
                        return SizedBox(
                          height: 40,
                          child: Center(
                              child: Text(
                            '--已加载全部数据--',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.withOpacity(0.6),
                            ),
                          )),
                        );
                      }
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: SizedBox(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '$index - ${dataList.elementAt(index)}',
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, index) {
                    return Divider(
                      height: 0.5,
                      color: Colors.grey.withOpacity(0.5),
                    );
                  },
                  itemCount: dataList.length,
                ),
              ),
            ),
            Positioned(
              right: 40,
              bottom: 80,
              child: BackToTop(
                show: showBackToTopButton,
                onPress: () {
                  _handleBackToTop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackToTop extends StatelessWidget {
  final bool show;
  final void Function()? onPress;
  const BackToTop({
    super.key,
    required this.show,
    this.onPress,
  });

  _handleTap() {
    if (onPress != null) {
      onPress!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return show
        ? GestureDetector(
            child: ClipOval(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.grey.withOpacity(0.3),
                child: Center(
                  child: Transform.rotate(
                    angle: 0.5 * pi,
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {
              _handleTap();
            },
          )
        : const SizedBox.shrink();
  }
}
