import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const TabScaffoldApp());

class TabScaffoldApp extends StatelessWidget {
  const TabScaffoldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TabScaffoldExample(),
    );
  }
}

class TabScaffoldExample extends StatefulWidget {
  const TabScaffoldExample({super.key});

  @override
  State<TabScaffoldExample> createState() => _TabScaffoldExampleState();
}

class _TabScaffoldExampleState extends State<TabScaffoldExample> {
  Future<bool?> showDeleteConfirmDialog1(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("提示"),
          content: const Text("您确定要删除当前文件吗?"),
          actions: [
            TextButton(
              child: const Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            TextButton(
              child: const Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Page 1 of Tab $index'),
              ),
              child: Center(
                child: CupertinoButton(
                  child: const Text('Next Page'),
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute<void>(
                      builder: (BuildContext context) {
                        return CupertinoPageScaffold(
                          navigationBar: const CupertinoNavigationBar(),
                          child: Center(
                            child: CupertinoButton(
                              child: const Text('back'),
                              onPressed: () async {
                                // Navigator.of(context).pop();
                                bool? delete =
                                    await showDeleteConfirmDialog1(context);
                                if (delete == null) {
                                  print("取消删除");
                                } else {
                                  print("已确认删除");
                                }
                              },
                            ),
                          ),
                        );
                      },
                    ));
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
