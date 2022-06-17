import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:calculator/app/modules/home/controller/home_controller.dart';
import 'package:calculator/app/modules/home/widgets/landscape_layout.dart';
import 'package:calculator/app/modules/home/widgets/result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/portrait_layout.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;
  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var orientation =
        MediaQuery.of(context).orientation == Orientation.portrait ? 0 : 1;
    return SafeArea(
      child: BlocListener<HomeController, HomeState>(
        bloc: controller,
        listener: (context, state) {
          if (state.status == HomeStatus.failure) {
            AsukaSnackbar.alert(
                    'Error to calculate your operation (${state.operation})')
                .show();
          }
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocSelector<HomeController, HomeState, HomeState>(
                  bloc: controller,
                  selector: (state) => state,
                  builder: (context, state) {
                    return ResultWidget(
                      history: state.history.last,
                      valueToDisplay: state.result,
                    );
                  },
                ),
                LayoutBuilder(
                  builder: ((context, _) {
                    if (orientation == 0) {
                      return PortraitLayout(controller: controller);
                    }
                    return LandscapeLayout(controller: controller);
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
