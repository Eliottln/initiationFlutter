import 'package:flutter/material.dart';
import 'package:spots_discovery/data/endpoint/spot_endpoint.dart';
import 'package:spots_discovery/data/model/spot.dart';

class DetailsViewModel extends ChangeNotifier {
  final SpotEndpoint _spotEndpoint;
  DetailsViewModel(this._spotEndpoint, int id) {
    _init(id);
  }

  Spot spot = Spot(id: 0);

  Future<void> _init(int id) async {
    // Mapping data
    spot = (await _spotEndpoint.getSpotById(id));
    notifyListeners();
  }
}
