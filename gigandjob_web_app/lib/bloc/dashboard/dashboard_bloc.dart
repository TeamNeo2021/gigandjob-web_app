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
      final DateFormat formatter = DateFormat('MM-dd-yyyy');
      final String formatted = formatter.format(DateTime.now());

      var api_url = 'http://localhost:3000';
      var url = Uri.parse(api_url + '/dashboard/' + formatted);
      var headers = {
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      };
      //I think its better using switch
      if (event is UpdateDashboard) {
        var response = await http.get(url, headers: headers);

        if (response.statusCode == 200) {
          var results = dashboardModelDTO.fromJson(jsonDecode(response.body));
          emit(DashboardState(
              meetings: results.meetings,
              employers: results.employers,
              users: results.users));
        }
      }
    });
  }
}
