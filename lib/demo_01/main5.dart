import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const PageViewExample());

class PageViewExample extends StatefulWidget {
  const PageViewExample({super.key});

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(),
      home: CupertinoPageScaffold(
        child: PageView.builder(
          allowImplicitScrolling: true,
          itemCount: 8,
          itemBuilder: (context, index) {
            print('current: $index');
            return Page(text: '$index');
          },
        ),
      ),
    );
  }
}

class Page extends StatefulWidget {
  const Page({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Align(
      // alignment: Alignment.topCenter,
      child: ColoredBox(
        color: Colors.lightBlue.withOpacity(0.3),
        child: Center(
          widthFactor: 2,
          heightFactor: 2,
          child: Text(widget.text),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
