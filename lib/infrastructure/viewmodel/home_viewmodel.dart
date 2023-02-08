import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spots_discovery/data/endpoint/spot_endpoint.dart';
import 'package:spots_discovery/data/model/spot.dart';
import 'package:spots_discovery/ui/details.dart';

class HomeViewModel extends ChangeNotifier {
  final SpotEndpoint _spotEndpoint;
  HomeViewModel(this._spotEndpoint) {
    _init();
  }

  List<Spot> spots = <Spot>[];

  Future<void> _init() async {
    // Opening json file
    // var jsonString = await rootBundle.loadString("assets/json/spots.json");
    // Decoding json
    // var json = jsonDecode(jsonString);
    // Mapping data
    spots = ((await _spotEndpoint.getSpots()).data as List<dynamic>)
        .map((json) => Spot.fromJson(json))
        .toList();
    notifyListeners();
  }

  void loadMore() {
    /// TODO
  }

  Spot getRandom() {
    /// TODO
    return Spot(id: 0);
  }

  void navigateToDetail(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailsScreen(
                spotId: spots[index].id,
              )),
    );
  }

  void getSpotByName(String name) {
    /// TODO
  }
}
