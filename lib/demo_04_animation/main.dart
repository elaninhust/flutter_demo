import 'dart:io';
import 'package:country_codes/country_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/demo_04_animation/my_first_page.dart';

import 'package:share_handler/share_handler.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await CountryCodes.init();
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  SharedMedia? media;

  // @override
  // Widget build(BuildContext context) {
  //   return const CupertinoApp(
  //     theme: CupertinoThemeData(primaryColor: Colors.blue),
  //     home: MyFirstPage(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en', 'US'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Share Handler'),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              Text(
                  "Shared to conversation identifier: ${media?.conversationIdentifier}"),
              const SizedBox(height: 10),
              Text("Shared text: ${media?.content}"),
              const SizedBox(height: 10),
              Text("Shared files: ${media?.attachments?.length}"),
              ...(media?.attachments ?? []).map((attachment) {
                final path = attachment?.path;
                if (path != null &&
                    attachment?.type == SharedAttachmentType.image) {
                  return Column(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          print('media: ${media?.content}');

                          // await CountryCodes.init();

                          // final Locale deviceLocale =
                          //     CountryCodes.getDeviceLocale()!;
                          // print(deviceLocale.languageCode); // Displays en
                          // print(deviceLocale.countryCode);

                          // final CountryDetails details =
                          //     CountryCodes.detailsForLocale(
                          //         Localizations.localeOf(context));

                          // print(details
                          //     .alpha2Code); // Displays alpha2Code, displays PT.
                          // print(details
                          //     .dialCode); // Displays the dial code for PT, +351.
                          // print(details
                          //     .name); // Displays the extended name, Portugal.

                          // ShareHandlerPlatform.instance.recordSentMessage(
                          //   conversationIdentifier:
                          //       "custom-conversation-identifier",
                          //   conversationName: "John Doe",
                          //   conversationImageFilePath: path,
                          //   serviceName: "custom-service-name",
                          // );
                        },
                        child: const Text("Record message"),
                      ),
                      const SizedBox(height: 10),
                      Image.file(
                        File(path),
                        width: 80,
                        height: 80,
                      ),
                    ],
                  );
                } else {
                  return Text(
                      "${attachment?.type} Attachment: ${attachment?.path}");
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> initPlatformState() async {
    final handler = ShareHandlerPlatform.instance;
    media = await handler.getInitialSharedMedia();

    handler.sharedMediaStream.listen((SharedMedia media) {
      if (!mounted) return;
      setState(() {
        this.media = media;
      });
    });
    if (!mounted) return;

    setState(() {
      // _platformVersion = platformVersion;
    });
  }
}
