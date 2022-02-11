import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class dashboardModelDTO {
  int meetings;
  int employers;
  int users;

  dashboardModelDTO(
      {required this.meetings, required this.employers, required this.users});

  factory dashboardModelDTO.fromJson(Map<String, dynamic> json) {
    return dashboardModelDTO(
      meetings: json['meetings'],
      employers: json['employers'],
      users: json['users'],
    );
  }
}

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState()) {
    on<DashboardEvent>((event, emit) async {
      var api_url = 'https://salvacion-git-job.herokuapp.com';
      var url = Uri.parse(api_url + '/dashboard');

      //I think its better using switch
      if (event is UpdateDashboard) {
        var response = await http.get(url);

        if (response.statusCode == 200) {
          var results = dashboardModelDTO.fromJson(jsonDecode(response.body));
          emit(DashboardState(
              meetings: results.meetings,
              employers: results.employers,
              users: results.users));
        } else {
          print(response);
        }
      }
    });
  }
}
