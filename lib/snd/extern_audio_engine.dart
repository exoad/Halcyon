import 'dart:io';

import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:audiotags/audiotags.dart';

final class HalcyonAudioSource {
  final AudioSource source;
  final String path;
  final HalcyonAudioTags tags;

  const HalcyonAudioSource(this.source, this.path, this.tags);
}

final class HalcyonAudioTags {
  final String title;
  final String artist;
  final String album;
  final String genre;
  final int year;
  final String albumArtist;
  final int trackNumber;
  final int trackTotal;
  final int discNumber;
  final int discTotal;
  final int duration;
  final List<Picture> pictures;

  const HalcyonAudioTags({
    required this.title,
    required this.artist,
    required this.album,
    required this.genre,
    required this.year,
    required this.albumArtist,
    required this.trackNumber,
    required this.trackTotal,
    required this.discNumber,
    required this.discTotal,
    required this.duration,
    required this.pictures,
  });

  static Future<HalcyonAudioTags> readTags(String path) async {
    Tag? tags = await AudioTags.read(path);
    return HalcyonAudioTags(
      title: tags?.title ??
          path
              .split(Platform.pathSeparator)
              .last
              .split(".")
              .first, // take the path, split it by the path separator, take the last element, split it by the dot, and take the first element so we only get the file name
      artist: tags?.trackArtist ?? "Unknown",
      album: tags?.album ?? "Unknown",
      genre: tags?.genre ?? "Unknown",
      year: tags?.year ?? 0,
      albumArtist: tags?.albumArtist ?? "",
      trackNumber: tags?.trackNumber ?? 0,
      trackTotal: tags?.trackTotal ?? 0,
      discNumber: tags?.discNumber ?? 0,
      discTotal: tags?.discTotal ?? 0,
      duration: tags?.duration ?? 0,
      pictures: tags?.pictures ?? <Picture>[],
    );
  }

  static Future<void> writeTags(
          {required String path,
          required HalcyonAudioTags tags}) async =>
      await AudioTags.write(
          path,
          Tag(
            title: tags.title,
            trackArtist: tags.artist,
            album: tags.album,
            genre: tags.genre,
            year: tags.year,
            albumArtist: tags.albumArtist,
            trackNumber: tags.trackNumber,
            trackTotal: tags.trackTotal,
            discNumber: tags.discNumber,
            discTotal: tags.discTotal,
            duration: tags.duration,
            pictures: tags.pictures,
          ));
}
