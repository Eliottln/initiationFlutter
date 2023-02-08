import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:spots_discovery/data/endpoint/spot_endpoint.dart';
import 'package:spots_discovery/infrastructure/viewmodel/details_viewmodel.dart';

class DetailsScreen extends StatelessWidget {
  final spotId;
  const DetailsScreen({super.key, this.spotId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailsViewModel>(
      create: (context) => DetailsViewModel(SpotEndpoint(GetIt.I.get<Dio>()), spotId),
      builder: (context, __) => Scaffold(
        appBar: AppBar(
          title: Text(Provider.of<DetailsViewModel>(context).spot.title ?? ""),
        ),
        body: Consumer<DetailsViewModel>(builder: (context, viewModel, child) =>
          SafeArea(
            child: Column(children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  child: Image.network(
                    viewModel.spot.imageFullsize ?? "",
                    height: 200,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.no_photography),
                  ),
                )
              ),
              Text(viewModel.spot.address ?? ""),
              Text(viewModel.spot.trainStation ?? ""),
              // Column(
              //   mainAxisSize: MainAxisSize.max,
              //   children: [
              //   Text("Catégories :"),
              //   ListView.builder(
              // itemCount: 2,
              // itemBuilder: (context, index) {
              //   return Text("Catégorie $index");
              // }
              // )
              // ])
            ])
          )
        ),
      ),
      lazy: false,
    );
  }
}
