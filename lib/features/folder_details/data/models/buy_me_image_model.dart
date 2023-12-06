import 'package:equatable/equatable.dart';

class BuyMeImage extends Equatable {
  final String? imageId;
  final String? imageUrl;
  final String? resizeImageUrl;
  final String? directionId;
  final String? directionName;
  final String? directionSlug;
  final List<num?>? imageSize;

  const BuyMeImage({
    this.imageId,
    this.imageUrl,
    this.resizeImageUrl,
    this.directionId,
    this.directionName,
    this.directionSlug,
    this.imageSize,
  });

  factory BuyMeImage.fromJson(Map<String, dynamic> json) {
    return BuyMeImage(
      imageId: json['imageId']?.toString(),
      imageUrl: json['imageUrl']?.toString(),
      resizeImageUrl: json['resizeImageUrl']?.toString(),
      directionId: json['directionId']?.toString(),
      directionName: json['directionName']?.toString(),
      directionSlug: json['directionSlug']?.toString(),
      imageSize: json['imageSize'] is List
          ? json['imageSize']
              .map<num?>((e) => num.tryParse(e.toString()))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        if (imageId != null) 'imageId': imageId,
        if (imageUrl != null) 'imageUrl': imageUrl,
        if (resizeImageUrl != null) 'resizeImageUrl': resizeImageUrl,
        if (directionId != null) 'directionId': directionId,
        if (directionName != null) 'directionName': directionName,
        if (directionSlug != null) 'directionSlug': directionSlug,
        if (imageSize != null) 'imageSize': imageSize,
      };

  BuyMeImage copyWith({
    String? imageId,
    String? imageUrl,
    String? resizeImageUrl,
    String? directionId,
    String? directionName,
    String? directionSlug,
    List<num?>? imageSize,
  }) {
    return BuyMeImage(
      imageId: imageId ?? this.imageId,
      imageUrl: imageUrl ?? this.imageUrl,
      resizeImageUrl: resizeImageUrl ?? this.resizeImageUrl,
      directionId: directionId ?? this.directionId,
      directionName: directionName ?? this.directionName,
      directionSlug: directionSlug ?? this.directionSlug,
      imageSize: imageSize ?? this.imageSize,
    );
  }

  @override
  List<Object?> get props {
    return [
      imageId,
      imageUrl,
      resizeImageUrl,
      directionId,
      directionName,
      directionSlug,
      imageSize,
    ];
  }
}

class BuyMeImageResponse extends Equatable {
  final List<BuyMeImage>? images;

  const BuyMeImageResponse({
    this.images,
  });

  factory BuyMeImageResponse.fromJson(Map<String, dynamic> json) {
    return BuyMeImageResponse(
      images: json['images'] is List
          ? json['images']
              .map<BuyMeImage>((e) => BuyMeImage.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        if (images != null) 'images': images,
      };

  BuyMeImageResponse copyWith({
    List<BuyMeImage>? images,
  }) {
    return BuyMeImageResponse(
      images: images ?? this.images,
    );
  }

  @override
  List<Object?> get props {
    return [
      images,
    ];
  }
}
