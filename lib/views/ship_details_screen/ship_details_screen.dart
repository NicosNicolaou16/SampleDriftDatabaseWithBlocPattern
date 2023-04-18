import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampledriftdatabasewithblocpattern/data/models/ship_details/ship_details_data_model.dart';
import 'package:sampledriftdatabasewithblocpattern/utils/alerts_dialog.dart';
import 'package:sampledriftdatabasewithblocpattern/views/ship_details_screen/ship_details_bloc.dart';
import 'package:sampledriftdatabasewithblocpattern/views/ship_details_screen/ship_details_events/ship_details_events.dart';
import 'package:sampledriftdatabasewithblocpattern/views/ship_details_screen/ship_details_states/ship_details_states.dart';

class ShipDetailsScreen extends StatefulWidget {
  final String shipId;

  const ShipDetailsScreen({Key? key, required this.shipId}) : super(key: key);

  @override
  State<ShipDetailsScreen> createState() => _ShipDetailsScreenState();
}

class _ShipDetailsScreenState extends State<ShipDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "Details Screen",
            style: TextStyle(
              fontSize: 21,
            ),
          ),
        ),
        body: BlocProvider(
          create: (_) => ShipDetailsBloc(ShipDetailsInitialState()),
          child: BlocListener<ShipDetailsBloc, ShipDetailsStates>(
            listener: (context, state) {
              if (state is ShipDetailsErrorState) {
                AlertsDialog.showAlertDialog(state.error ?? "", context);
              }
            },
            child: BlocBuilder<ShipDetailsBloc, ShipDetailsStates>(
              builder: (context, state) {
                if (state is ShipDetailsInitialState) {
                  context
                      .read<ShipDetailsBloc>()
                      .add(ShipDetailsLocalQuery(widget.shipId));
                } else if (state is ShipDetailsLoadedState) {
                  return _mainView(state, context);
                } else if (state is ShipDetailsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _mainView(ShipDetailsLoadedState state, BuildContext context) {
    return ListView.builder(
        itemCount: state.shipDetailsDataModelList.length,
        itemBuilder: (context, index) {
          ShipDetailsDataModel shipDetailsDataModel =
              state.shipDetailsDataModelList[index];
          if (shipDetailsDataModel.shipDetailsViewType ==
              ShipDetailsViewType.PHOTO_VIEW_TYPE) {
            return _imageView(shipDetailsDataModel);
          } else {
            return _infoView(shipDetailsDataModel);
          }
        });
  }

  Widget _imageView(ShipDetailsDataModel shipDetailsDataModel) {
    return Image.network(
      shipDetailsDataModel.shipsEntity.image ?? "",
      height: 300,
      width: 50,
      fit: BoxFit.cover,
      errorBuilder: (
          BuildContext context,
          Object error,
          StackTrace? stackTrace,
          ) {
        return const SizedBox(
          height: 300,
          width: 50,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Icon(
              Icons.image,
            ),
          ),
        );
      },
    );
  }

  Widget _infoView(ShipDetailsDataModel shipDetailsDataModel) {
    return Center(
      child: Column(
        children: [
          Text(
            shipDetailsDataModel.shipsEntity.shipName ?? "",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          Text(
            shipDetailsDataModel.shipsEntity.shipType ?? "",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
