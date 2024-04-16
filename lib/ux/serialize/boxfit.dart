import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum BoxFitSerializable {
  @JsonValue("fill")
  fill(BoxFit.fill),
  @JsonValue("contain")
  contain(BoxFit.contain),
  @JsonValue("cover")
  cover(BoxFit.cover),
  @JsonValue("fit-width")
  fitWidth(BoxFit.fitWidth),
  @JsonValue("none")
  none(BoxFit.none),
  @JsonValue("fit-height")
  fitHeight(BoxFit.fitHeight),
  @JsonValue("scale-down")
  scaleDown(BoxFit.scaleDown);

  final BoxFit _fit;

  const BoxFitSerializable(this._fit);

  BoxFit get fit => _fit;
}
