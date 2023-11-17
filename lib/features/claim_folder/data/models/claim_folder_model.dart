// To parse this JSON data, do
//
//     final claimFolderModel = claimFolderModelFromMap(jsonString);

import 'dart:convert';

ClaimFolderModel claimFolderModelFromMap(String str) =>
    ClaimFolderModel.fromMap(json.decode(str));

String claimFolderModelToMap(ClaimFolderModel data) =>
    json.encode(data.toMap());

class ClaimFolderModel {
  String? claimId;
  String? claimName;
  String? externalSessionId;

  ClaimFolderModel({
    this.claimId,
    this.claimName,
    this.externalSessionId,
  });

  ClaimFolderModel copyWith({
    String? claimId,
    String? claimName,
    String? externalSessionId,
  }) =>
      ClaimFolderModel(
        claimId: claimId ?? this.claimId,
        claimName: claimName ?? this.claimName,
        externalSessionId: externalSessionId ?? this.externalSessionId,
      );

  factory ClaimFolderModel.fromMap(Map<String, dynamic> json) =>
      ClaimFolderModel(
        claimId: json["claimId"],
        claimName: json["claimName"],
        externalSessionId: json["externalSessionId"],
      );

  Map<String, dynamic> toMap() => {
        "claimId": claimId,
        "claimName": claimName,
        "externalSessionId": externalSessionId,
      };
}
