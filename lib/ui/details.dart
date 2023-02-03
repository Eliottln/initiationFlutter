import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:spots_discovery/data/endpoint/spot_endpoint.dart';
import 'package:spots_discovery/infrastructure/viewmodel/home_viewmodel.dart';

class DetailsScreen extends StatelessWidget {
  final spotId;
  const DetailsScreen({super.key, this.spotId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(SpotEndpoint(GetIt.I.get<Dio>())),
      builder: (_, __) => Scaffold(
        appBar: AppBar(
          title: const Text("Liste de lieux"),
        ),
        body: Consumer<HomeViewModel>(builder: (context, viewModel, child) =>
          const SafeArea(
            child: Text("")
          )
        ),
      ),
      lazy: false,
    );
  }
}
