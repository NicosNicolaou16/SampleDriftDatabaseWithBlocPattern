import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampledriftdatabasewithblocpattern/data/models/ships/ships_data_model.dart';
import 'package:sampledriftdatabasewithblocpattern/utils/alerts_dialog/alerts_dialog.dart';
import 'package:sampledriftdatabasewithblocpattern/views/ships_screen/ships_bloc.dart';
import 'package:sampledriftdatabasewithblocpattern/views/ships_screen/ships_events/ships_events.dart';
import 'package:sampledriftdatabasewithblocpattern/views/ships_screen/ships_states/ships_states.dart';

import '../ship_details_screen/ship_details_screen.dart';

class ShipsScreen extends StatefulWidget {
  const ShipsScreen({Key? key}) : super(key: key);

  @override
  State<ShipsScreen> createState() => _ShipsScreenState();
}

class _ShipsScreenState extends State<ShipsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "Ships List",
            style: TextStyle(
              fontSize: 21,
            ),
          ),
        ),
        body: BlocProvider(
          create: (_) => ShipsBloc(ShipsInitialState()),
          child: BlocConsumer<ShipsBloc, ShipsStates>(
            listener: (context, state) {
              if (state is ShipsErrorState) {
                AlertsDialog.showAlertDialog(state.error ?? "", context);
              }
            },
            builder: (context, state) {
              if (state is ShipsInitialState) {
                context.read<ShipsBloc>().add(ShipsFetchData());
              } else if (state is ShipsLoadedState) {
                return _mainView(state, context);
              } else if (state is ShipsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget _mainView(ShipsLoadedState state, BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            left: 3,
            right: 3,
          ),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Searching...',
            ),
            onChanged: (value) {
              context.read<ShipsBloc>().add(ShipsLocalSearch(value));
            },
          ),
        ),
        _listOfShips(state.shipsDataModelList),
      ],
    );
  }

  Widget _listOfShips(List<ShipsDataModel> shipsDataModelList) {
    return Expanded(
      child: ListView.builder(
          itemCount: shipsDataModelList.length,
          itemBuilder: (context, index) {
            ShipsDataModel shipsDataModel = shipsDataModelList[index];
            return _cardView(shipsDataModel);
          }),
    );
  }

  Widget _cardView(ShipsDataModel shipsDataModel) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShipDetailsScreen(
                    shipId: shipsDataModel.shipsEntity.id ?? "-1",
                  )),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(3),
        height: 150,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.grey,
          elevation: 9,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: Image.network(
                  shipsDataModel.shipsEntity.image ?? "",
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (
                    BuildContext context,
                    Object error,
                    StackTrace? stackTrace,
                  ) {
                    return const SizedBox(
                      height: 150,
                      width: 150,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Icon(
                          Icons.image,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      shipsDataModel.shipsEntity.shipName ?? "",
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      shipsDataModel.shipsEntity.shipType ?? "",
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
