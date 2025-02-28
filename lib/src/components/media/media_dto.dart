part of '../../../ds.dart';

class MediaDto {
  final String? id;
  final String? url;
  final String? thumbnailUrl;
  final String? name;
  final File? file;
  final String? base64;
  final String? bytes;

  MediaDto({
    this.id,
    this.url,
    this.thumbnailUrl,
    this.name,
    this.file,
    this.base64,
    this.bytes,
  });
}
