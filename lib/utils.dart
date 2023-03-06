import 'package:flutter/material.dart';

Widget buildSectionWidget(String label, String value) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SelectableText(
        label,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
      ),
      const SizedBox(height: 4),
      Text(value)
    ]),
  );
}

Widget buildFooter() {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Opacity(
          opacity: 0.6,
          child: Text('Dane pochodzą ze strony https://wiki.piwo.org/'),
        ),
      ],
    ),
  );
}
