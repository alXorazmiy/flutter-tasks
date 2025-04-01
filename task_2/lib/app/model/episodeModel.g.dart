// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodeModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EpisodemodelAdapter extends TypeAdapter<Episodemodel> {
  @override
  final int typeId = 1;

  @override
  Episodemodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Episodemodel(
      id: fields[0] as int,
      name: fields[1] as String,
      episode: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Episodemodel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.episode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EpisodemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
