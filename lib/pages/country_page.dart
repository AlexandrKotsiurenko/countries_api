import 'dart:math';

import 'package:countries/models/country_model.dart';
import 'package:countries/services/country_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final _countryService = CountryService().getCountries();
  int currentCountry = 0;

  @override
  void initState() {
    super.initState();
  }

  void refreshCountry() {
    setState(() {
      currentCountry = Random().nextInt(250);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<List<Country>>(
            future: _countryService,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(snapshot.data![currentCountry].flag),
                            const SizedBox(height: 24),
                            Text(
                              snapshot.data![currentCountry].commonName,
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text('Official name: ${snapshot.data![currentCountry].officialName}'),
                            const SizedBox(height: 10),
                            Text('Region: ${snapshot.data![currentCountry].region}'),
                            const SizedBox(height: 10),
                            Text('Population: ${snapshot.data![currentCountry].population}'),
                          ],
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: refreshCountry,
                        backgroundColor: Colors.black,
                        child: const Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Text('ERROR');
              }
            },
          ),
        ),
      ),
    );
  }
}
