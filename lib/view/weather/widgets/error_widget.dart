
import 'package:weather_app/bloc/weather_bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../configs/components/internet_exception_widget.dart'; // Importing the InternetExceptionWidget

/// A widget for displaying error messages related to movies.
class WeatherErrorWidget extends StatelessWidget {
  final String query;
  const WeatherErrorWidget({required this.query});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      buildWhen: (previous, current) => previous.weather != current.weather,
      builder: (context, state) {
        // Checking if the error message indicates no internet connection
        if (state.weather.message.toString() == AppLocalizations.of(context)!.noInternetConnection) {
          // Displaying InternetExceptionWidget if there's no internet connection
          return InterNetExceptionWidget(onPress: () {
            // Dispatching PostFetched event to trigger fetching movies data
            context.read<WeatherBloc>().add(FetchWeather(searchQuery: query));
          });
        } else {
          // Displaying error message as a clickable text if it's not related to internet connection
          return InkWell(
            onTap: () {
              // Dispatching PostFetched event to trigger fetching movies data
              context.read<WeatherBloc>().add(FetchWeather(searchQuery: query));
            },
            child: Center(
              child: Text(state.weather.message.toString()),
            ),
          );
        }
      },
    );
  }
}
