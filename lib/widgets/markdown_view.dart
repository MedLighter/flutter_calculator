import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownView extends StatefulWidget {
  const MarkdownView({super.key});

  @override
  State<StatefulWidget> createState() => _MarkdownViewState();
}

class _MarkdownViewState extends State<MarkdownView> {
  final data = rootBundle.loadString("assets/usage.md");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Инструкция",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      ),
      body: FutureBuilder(
        future: data,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Expanded(
                    child: Markdown(
                  data: snapshot.data!,
                  styleSheet: MarkdownStyleSheet(
                      h1: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
                      h3: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
                      p: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground)),
                )),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
