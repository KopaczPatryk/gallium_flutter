// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hashes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HashesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() generating,
    required TResult Function(
            Hash lastGenerated, List<Hash> allHashes, int totalCount)
        generated,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? generating,
    TResult? Function(Hash lastGenerated, List<Hash> allHashes, int totalCount)?
        generated,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? generating,
    TResult Function(Hash lastGenerated, List<Hash> allHashes, int totalCount)?
        generated,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Generating value) generating,
    required TResult Function(_Generated value) generated,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Generated value)? generated,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Generating value)? generating,
    TResult Function(_Generated value)? generated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HashesStateCopyWith<$Res> {
  factory $HashesStateCopyWith(
          HashesState value, $Res Function(HashesState) then) =
      _$HashesStateCopyWithImpl<$Res, HashesState>;
}

/// @nodoc
class _$HashesStateCopyWithImpl<$Res, $Val extends HashesState>
    implements $HashesStateCopyWith<$Res> {
  _$HashesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$HashesStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'HashesState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() generating,
    required TResult Function(
            Hash lastGenerated, List<Hash> allHashes, int totalCount)
        generated,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? generating,
    TResult? Function(Hash lastGenerated, List<Hash> allHashes, int totalCount)?
        generated,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? generating,
    TResult Function(Hash lastGenerated, List<Hash> allHashes, int totalCount)?
        generated,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Generating value) generating,
    required TResult Function(_Generated value) generated,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Generated value)? generated,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Generating value)? generating,
    TResult Function(_Generated value)? generated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HashesState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_GeneratingCopyWith<$Res> {
  factory _$$_GeneratingCopyWith(
          _$_Generating value, $Res Function(_$_Generating) then) =
      __$$_GeneratingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GeneratingCopyWithImpl<$Res>
    extends _$HashesStateCopyWithImpl<$Res, _$_Generating>
    implements _$$_GeneratingCopyWith<$Res> {
  __$$_GeneratingCopyWithImpl(
      _$_Generating _value, $Res Function(_$_Generating) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Generating implements _Generating {
  const _$_Generating();

  @override
  String toString() {
    return 'HashesState.generating()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Generating);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() generating,
    required TResult Function(
            Hash lastGenerated, List<Hash> allHashes, int totalCount)
        generated,
    required TResult Function() error,
  }) {
    return generating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? generating,
    TResult? Function(Hash lastGenerated, List<Hash> allHashes, int totalCount)?
        generated,
    TResult? Function()? error,
  }) {
    return generating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? generating,
    TResult Function(Hash lastGenerated, List<Hash> allHashes, int totalCount)?
        generated,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (generating != null) {
      return generating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Generating value) generating,
    required TResult Function(_Generated value) generated,
    required TResult Function(_Error value) error,
  }) {
    return generating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Generated value)? generated,
    TResult? Function(_Error value)? error,
  }) {
    return generating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Generating value)? generating,
    TResult Function(_Generated value)? generated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (generating != null) {
      return generating(this);
    }
    return orElse();
  }
}

abstract class _Generating implements HashesState {
  const factory _Generating() = _$_Generating;
}

/// @nodoc
abstract class _$$_GeneratedCopyWith<$Res> {
  factory _$$_GeneratedCopyWith(
          _$_Generated value, $Res Function(_$_Generated) then) =
      __$$_GeneratedCopyWithImpl<$Res>;
  @useResult
  $Res call({Hash lastGenerated, List<Hash> allHashes, int totalCount});
}

/// @nodoc
class __$$_GeneratedCopyWithImpl<$Res>
    extends _$HashesStateCopyWithImpl<$Res, _$_Generated>
    implements _$$_GeneratedCopyWith<$Res> {
  __$$_GeneratedCopyWithImpl(
      _$_Generated _value, $Res Function(_$_Generated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastGenerated = null,
    Object? allHashes = null,
    Object? totalCount = null,
  }) {
    return _then(_$_Generated(
      lastGenerated: null == lastGenerated
          ? _value.lastGenerated
          : lastGenerated // ignore: cast_nullable_to_non_nullable
              as Hash,
      allHashes: null == allHashes
          ? _value._allHashes
          : allHashes // ignore: cast_nullable_to_non_nullable
              as List<Hash>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Generated implements _Generated {
  const _$_Generated(
      {required this.lastGenerated,
      required final List<Hash> allHashes,
      required this.totalCount})
      : _allHashes = allHashes;

  @override
  final Hash lastGenerated;
  final List<Hash> _allHashes;
  @override
  List<Hash> get allHashes {
    if (_allHashes is EqualUnmodifiableListView) return _allHashes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allHashes);
  }

  @override
  final int totalCount;

  @override
  String toString() {
    return 'HashesState.generated(lastGenerated: $lastGenerated, allHashes: $allHashes, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Generated &&
            (identical(other.lastGenerated, lastGenerated) ||
                other.lastGenerated == lastGenerated) &&
            const DeepCollectionEquality()
                .equals(other._allHashes, _allHashes) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastGenerated,
      const DeepCollectionEquality().hash(_allHashes), totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeneratedCopyWith<_$_Generated> get copyWith =>
      __$$_GeneratedCopyWithImpl<_$_Generated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() generating,
    required TResult Function(
            Hash lastGenerated, List<Hash> allHashes, int totalCount)
        generated,
    required TResult Function() error,
  }) {
    return generated(lastGenerated, allHashes, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? generating,
    TResult? Function(Hash lastGenerated, List<Hash> allHashes, int totalCount)?
        generated,
    TResult? Function()? error,
  }) {
    return generated?.call(lastGenerated, allHashes, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? generating,
    TResult Function(Hash lastGenerated, List<Hash> allHashes, int totalCount)?
        generated,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (generated != null) {
      return generated(lastGenerated, allHashes, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Generating value) generating,
    required TResult Function(_Generated value) generated,
    required TResult Function(_Error value) error,
  }) {
    return generated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Generated value)? generated,
    TResult? Function(_Error value)? error,
  }) {
    return generated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Generating value)? generating,
    TResult Function(_Generated value)? generated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (generated != null) {
      return generated(this);
    }
    return orElse();
  }
}

abstract class _Generated implements HashesState {
  const factory _Generated(
      {required final Hash lastGenerated,
      required final List<Hash> allHashes,
      required final int totalCount}) = _$_Generated;

  Hash get lastGenerated;
  List<Hash> get allHashes;
  int get totalCount;
  @JsonKey(ignore: true)
  _$$_GeneratedCopyWith<_$_Generated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$HashesStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error();

  @override
  String toString() {
    return 'HashesState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() generating,
    required TResult Function(
            Hash lastGenerated, List<Hash> allHashes, int totalCount)
        generated,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? generating,
    TResult? Function(Hash lastGenerated, List<Hash> allHashes, int totalCount)?
        generated,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? generating,
    TResult Function(Hash lastGenerated, List<Hash> allHashes, int totalCount)?
        generated,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Generating value) generating,
    required TResult Function(_Generated value) generated,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Generating value)? generating,
    TResult? Function(_Generated value)? generated,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Generating value)? generating,
    TResult Function(_Generated value)? generated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements HashesState {
  const factory _Error() = _$_Error;
}
