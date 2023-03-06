import 'package:beers_styles/entities/beer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../utils.dart';
import 'info_page.dart';

class BeerDetails extends StatefulWidget {
  final Beer beer;

  const BeerDetails({Key? key, required this.beer}) : super(key: key);

  @override
  State<BeerDetails> createState() => _BeerDetailsState();
}

class _BeerDetailsState extends State<BeerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.beer.name),
        backgroundColor: Colors.brown,
        actions: <Widget>[
          IconButton(
              icon: const Icon(CupertinoIcons.share),
              onPressed: () {
                Share.share(
                    'https://wiki.piwo.org/${widget.beer.name.replaceAll(' ', '_')}');
              }),
        ],
      ),
      body: ListView(
        children: [
          buildVitalWidget('og', widget.beer.ogMin, widget.beer.ogMax),
          buildVitalWidget('fg', widget.beer.fgMin, widget.beer.fgMax),
          buildVitalWidget('ibu', widget.beer.ibuMin, widget.beer.ibuMax),
          buildVitalWidget('srm', widget.beer.srmMin, widget.beer.srmMax),
          buildVitalWidget('abv', widget.beer.abvMin, widget.beer.abvMax),
          for (var label in widget.beer.sections.keys)
            buildSectionWidget(label, widget.beer.sections[label] ?? ''),
          buildFooter()
        ],
      ),
    );
  }

  Map<String, List<double>> vitalsRanges = {
    'og': [0.995, 1.180],
    'fg': [0.995, 1.180],
    'ibu': [0, 120],
    'srm': [0, 40],
    'abv': [0, 14]
  };

  Widget buildVitalWidget(String name, double? min, double? max) {
    return min != null
        ? GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const InfoPage()));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(name.toUpperCase()),
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Stack(
                              children: [
                                LinearProgressIndicator(
                                  value: ((max! - vitalsRanges[name]![0])) /
                                      (vitalsRanges[name]![1] -
                                          vitalsRanges[name]![0]),
                                  color: Colors.deepOrange,
                                  backgroundColor: Colors.orangeAccent,
                                ),
                                LinearProgressIndicator(
                                    value: (min - vitalsRanges[name]![0]) /
                                        (vitalsRanges[name]![1] -
                                            vitalsRanges[name]![0]),
                                    color: Colors.orangeAccent,
                                    backgroundColor: Colors.transparent),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                              '$min${name == 'abv' ? '%' : ''} - $max${name == 'abv' ? '%' : ''}')
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
