import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:freezed_annotation/freezed_annotation.dart';

/// As of Dart 3, Dart now has built-in pattern-matching using sealed classes.
/// Instead of using when/map, use the official Dart syntax.
const freezedBloc = Freezed(
  map: FreezedMapOptions.none,
  when: FreezedWhenOptions.none,
  fromJson: false,
  toJson: false,
);
