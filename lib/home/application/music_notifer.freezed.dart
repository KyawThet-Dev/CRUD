// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_notifer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MusicState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() noConnection,
    required TResult Function() empty,
    required TResult Function(ResponseInfoError error) error,
    required TResult Function(List<MusicModel> music) succes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noConnection,
    TResult? Function()? empty,
    TResult? Function(ResponseInfoError error)? error,
    TResult? Function(List<MusicModel> music)? succes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noConnection,
    TResult Function()? empty,
    TResult Function(ResponseInfoError error)? error,
    TResult Function(List<MusicModel> music)? succes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) succes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? succes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Empty value)? empty,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? succes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicStateCopyWith<$Res> {
  factory $MusicStateCopyWith(
          MusicState value, $Res Function(MusicState) then) =
      _$MusicStateCopyWithImpl<$Res, MusicState>;
}

/// @nodoc
class _$MusicStateCopyWithImpl<$Res, $Val extends MusicState>
    implements $MusicStateCopyWith<$Res> {
  _$MusicStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MusicStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MusicState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() noConnection,
    required TResult Function() empty,
    required TResult Function(ResponseInfoError error) error,
    required TResult Function(List<MusicModel> music) succes,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noConnection,
    TResult? Function()? empty,
    TResult? Function(ResponseInfoError error)? error,
    TResult? Function(List<MusicModel> music)? succes,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noConnection,
    TResult Function()? empty,
    TResult Function(ResponseInfoError error)? error,
    TResult Function(List<MusicModel> music)? succes,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) succes,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? succes,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Empty value)? empty,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? succes,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MusicState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$MusicStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'MusicState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() noConnection,
    required TResult Function() empty,
    required TResult Function(ResponseInfoError error) error,
    required TResult Function(List<MusicModel> music) succes,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noConnection,
    TResult? Function()? empty,
    TResult? Function(ResponseInfoError error)? error,
    TResult? Function(List<MusicModel> music)? succes,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noConnection,
    TResult Function()? empty,
    TResult Function(ResponseInfoError error)? error,
    TResult Function(List<MusicModel> music)? succes,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) succes,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? succes,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Empty value)? empty,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? succes,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements MusicState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$NoConnectionImplCopyWith<$Res> {
  factory _$$NoConnectionImplCopyWith(
          _$NoConnectionImpl value, $Res Function(_$NoConnectionImpl) then) =
      __$$NoConnectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoConnectionImplCopyWithImpl<$Res>
    extends _$MusicStateCopyWithImpl<$Res, _$NoConnectionImpl>
    implements _$$NoConnectionImplCopyWith<$Res> {
  __$$NoConnectionImplCopyWithImpl(
      _$NoConnectionImpl _value, $Res Function(_$NoConnectionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoConnectionImpl implements _NoConnection {
  const _$NoConnectionImpl();

  @override
  String toString() {
    return 'MusicState.noConnection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoConnectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() noConnection,
    required TResult Function() empty,
    required TResult Function(ResponseInfoError error) error,
    required TResult Function(List<MusicModel> music) succes,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noConnection,
    TResult? Function()? empty,
    TResult? Function(ResponseInfoError error)? error,
    TResult? Function(List<MusicModel> music)? succes,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noConnection,
    TResult Function()? empty,
    TResult Function(ResponseInfoError error)? error,
    TResult Function(List<MusicModel> music)? succes,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) succes,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? succes,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Empty value)? empty,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? succes,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class _NoConnection implements MusicState {
  const factory _NoConnection() = _$NoConnectionImpl;
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<$Res> {
  factory _$$EmptyImplCopyWith(
          _$EmptyImpl value, $Res Function(_$EmptyImpl) then) =
      __$$EmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<$Res>
    extends _$MusicStateCopyWithImpl<$Res, _$EmptyImpl>
    implements _$$EmptyImplCopyWith<$Res> {
  __$$EmptyImplCopyWithImpl(
      _$EmptyImpl _value, $Res Function(_$EmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyImpl implements _Empty {
  const _$EmptyImpl();

  @override
  String toString() {
    return 'MusicState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() noConnection,
    required TResult Function() empty,
    required TResult Function(ResponseInfoError error) error,
    required TResult Function(List<MusicModel> music) succes,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noConnection,
    TResult? Function()? empty,
    TResult? Function(ResponseInfoError error)? error,
    TResult? Function(List<MusicModel> music)? succes,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noConnection,
    TResult Function()? empty,
    TResult Function(ResponseInfoError error)? error,
    TResult Function(List<MusicModel> music)? succes,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) succes,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? succes,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Empty value)? empty,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? succes,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements MusicState {
  const factory _Empty() = _$EmptyImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ResponseInfoError error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$MusicStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ResponseInfoError,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final ResponseInfoError error;

  @override
  String toString() {
    return 'MusicState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() noConnection,
    required TResult Function() empty,
    required TResult Function(ResponseInfoError error) error,
    required TResult Function(List<MusicModel> music) succes,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noConnection,
    TResult? Function()? empty,
    TResult? Function(ResponseInfoError error)? error,
    TResult? Function(List<MusicModel> music)? succes,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noConnection,
    TResult Function()? empty,
    TResult Function(ResponseInfoError error)? error,
    TResult Function(List<MusicModel> music)? succes,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) succes,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? succes,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Empty value)? empty,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? succes,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements MusicState {
  const factory _Error(final ResponseInfoError error) = _$ErrorImpl;

  ResponseInfoError get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MusicModel> music});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$MusicStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? music = null,
  }) {
    return _then(_$SuccessImpl(
      null == music
          ? _value._music
          : music // ignore: cast_nullable_to_non_nullable
              as List<MusicModel>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(final List<MusicModel> music) : _music = music;

  final List<MusicModel> _music;
  @override
  List<MusicModel> get music {
    if (_music is EqualUnmodifiableListView) return _music;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_music);
  }

  @override
  String toString() {
    return 'MusicState.succes(music: $music)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._music, _music));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_music));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() noConnection,
    required TResult Function() empty,
    required TResult Function(ResponseInfoError error) error,
    required TResult Function(List<MusicModel> music) succes,
  }) {
    return succes(music);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noConnection,
    TResult? Function()? empty,
    TResult? Function(ResponseInfoError error)? error,
    TResult? Function(List<MusicModel> music)? succes,
  }) {
    return succes?.call(music);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noConnection,
    TResult Function()? empty,
    TResult Function(ResponseInfoError error)? error,
    TResult Function(List<MusicModel> music)? succes,
    required TResult orElse(),
  }) {
    if (succes != null) {
      return succes(music);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) succes,
  }) {
    return succes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? succes,
  }) {
    return succes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Empty value)? empty,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? succes,
    required TResult orElse(),
  }) {
    if (succes != null) {
      return succes(this);
    }
    return orElse();
  }
}

abstract class _Success implements MusicState {
  const factory _Success(final List<MusicModel> music) = _$SuccessImpl;

  List<MusicModel> get music;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
