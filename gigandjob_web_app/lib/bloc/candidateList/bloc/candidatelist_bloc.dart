import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gigandjob_web_app/Dominio/Models/candidateListDTO.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'candidatelist_event.dart';
part 'candidatelist_state.dart';

class CandidatelistBloc extends Bloc<CandidatelistEvent, CandidateState> {
  CandidatelistBloc({required this.httpClient})
      : super(const CandidateState()) {
    on<CandidatelistEvent>(_onCandidateFetched);
  }

  final http.Client httpClient;
}

Future<void> _onCandidateFetched(
    CandidatelistEvent event, Emitter<CandidateState> emit) async {
  if (state.hasReachedMax) return;
  try {
    if (state.status == CandidateStatus.initial) {
      final posts = await _fetchPosts();
      return emit(state.copyWith(
        status: CandidateStatus.success,
        posts: posts,
        hasReachedMax: false,
      ));
    }
    final posts = await _fetchPosts(state.posts.length);
    emit(posts.isEmpty
        ? state.copyWith(hasReachedMax: true)
        : state.copyWith(
            status: CandidateStatus.success,
            posts: List.of(state.posts)..addAll(posts),
            hasReachedMax: false,
          ));
  } catch (_) {
    emit(state.copyWith(status: CandidateStatus.failure));
  }
}
