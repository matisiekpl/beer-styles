import 'package:beers_styles/screens/beer_details.dart';
import 'package:beers_styles/screens/info_page.dart';
import 'package:beers_styles/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../entities/beer.dart';
import '../store.dart';

class BeersList extends StatefulWidget {
  const BeersList({Key? key}) : super(key: key);

  @override
  State<BeersList> createState() => _BeersListState();
}

class _BeersListState extends State<BeersList> {
  List<Beer>? beers;
  List<Beer>? filteredBeers;

  @override
  void initState() {
    super.initState();
    loadBeers();
  }

  loadBeers() async {
    beers = await Store.instance.loadBeers();
    setState(() {
      filteredBeers = beers;
    });
  }

  onSearchChanged(String query) {
    var rows = (beers ?? [])
        .where((beer) =>
            beer.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredBeers = rows;
    });
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Style piwa 🍺'),
        backgroundColor: Colors.brown,
        actions: [
          IconButton(
              icon: const Icon(CupertinoIcons.info),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const InfoPage()));
              }),
        ],
      ),
      body: filteredBeers != null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4),
                        child: CupertinoSearchTextField(
                            onChanged: onSearchChanged,
                            style: TextStyle(
                                color: brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                            placeholder: 'Szukaj...'),
                      );
                    }
                    if (index == filteredBeers!.length + 1) {
                      return buildFooter();
                    }
                    var beer = filteredBeers![index - 1];
                    return Card(
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BeerDetails(beer: beer)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(beer.name,
                                style: const TextStyle(fontSize: 17)),
                          )),
                    );
                  },
                  itemCount: filteredBeers!.length + 2),
            )
          : const Center(child: CircularProgressIndicator(color: Colors.brown)),
    );
  }
}
