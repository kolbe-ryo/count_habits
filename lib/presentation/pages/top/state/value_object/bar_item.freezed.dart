// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bar_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BarItemList {
  List<BarItem> get barItemList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BarItemListCopyWith<BarItemList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarItemListCopyWith<$Res> {
  factory $BarItemListCopyWith(
          BarItemList value, $Res Function(BarItemList) then) =
      _$BarItemListCopyWithImpl<$Res, BarItemList>;
  @useResult
  $Res call({List<BarItem> barItemList});
}

/// @nodoc
class _$BarItemListCopyWithImpl<$Res, $Val extends BarItemList>
    implements $BarItemListCopyWith<$Res> {
  _$BarItemListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barItemList = null,
  }) {
    return _then(_value.copyWith(
      barItemList: null == barItemList
          ? _value.barItemList
          : barItemList // ignore: cast_nullable_to_non_nullable
              as List<BarItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BarItemListImplCopyWith<$Res>
    implements $BarItemListCopyWith<$Res> {
  factory _$$BarItemListImplCopyWith(
          _$BarItemListImpl value, $Res Function(_$BarItemListImpl) then) =
      __$$BarItemListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BarItem> barItemList});
}

/// @nodoc
class __$$BarItemListImplCopyWithImpl<$Res>
    extends _$BarItemListCopyWithImpl<$Res, _$BarItemListImpl>
    implements _$$BarItemListImplCopyWith<$Res> {
  __$$BarItemListImplCopyWithImpl(
      _$BarItemListImpl _value, $Res Function(_$BarItemListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barItemList = null,
  }) {
    return _then(_$BarItemListImpl(
      barItemList: null == barItemList
          ? _value._barItemList
          : barItemList // ignore: cast_nullable_to_non_nullable
              as List<BarItem>,
    ));
  }
}

/// @nodoc

class _$BarItemListImpl implements _BarItemList {
  const _$BarItemListImpl({final List<BarItem> barItemList = const []})
      : _barItemList = barItemList;

  final List<BarItem> _barItemList;
  @override
  @JsonKey()
  List<BarItem> get barItemList {
    if (_barItemList is EqualUnmodifiableListView) return _barItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_barItemList);
  }

  @override
  String toString() {
    return 'BarItemList(barItemList: $barItemList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarItemListImpl &&
            const DeepCollectionEquality()
                .equals(other._barItemList, _barItemList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_barItemList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BarItemListImplCopyWith<_$BarItemListImpl> get copyWith =>
      __$$BarItemListImplCopyWithImpl<_$BarItemListImpl>(this, _$identity);
}

abstract class _BarItemList implements BarItemList {
  const factory _BarItemList({final List<BarItem> barItemList}) =
      _$BarItemListImpl;

  @override
  List<BarItem> get barItemList;
  @override
  @JsonKey(ignore: true)
  _$$BarItemListImplCopyWith<_$BarItemListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BarItem {
  int get index => throw _privateConstructorUsedError;
  int get item => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BarItemCopyWith<BarItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarItemCopyWith<$Res> {
  factory $BarItemCopyWith(BarItem value, $Res Function(BarItem) then) =
      _$BarItemCopyWithImpl<$Res, BarItem>;
  @useResult
  $Res call({int index, int item});
}

/// @nodoc
class _$BarItemCopyWithImpl<$Res, $Val extends BarItem>
    implements $BarItemCopyWith<$Res> {
  _$BarItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? item = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BarItemImplCopyWith<$Res> implements $BarItemCopyWith<$Res> {
  factory _$$BarItemImplCopyWith(
          _$BarItemImpl value, $Res Function(_$BarItemImpl) then) =
      __$$BarItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, int item});
}

/// @nodoc
class __$$BarItemImplCopyWithImpl<$Res>
    extends _$BarItemCopyWithImpl<$Res, _$BarItemImpl>
    implements _$$BarItemImplCopyWith<$Res> {
  __$$BarItemImplCopyWithImpl(
      _$BarItemImpl _value, $Res Function(_$BarItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? item = null,
  }) {
    return _then(_$BarItemImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BarItemImpl implements _BarItem {
  const _$BarItemImpl({this.index = 0, this.item = 0});

  @override
  @JsonKey()
  final int index;
  @override
  @JsonKey()
  final int item;

  @override
  String toString() {
    return 'BarItem(index: $index, item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarItemImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BarItemImplCopyWith<_$BarItemImpl> get copyWith =>
      __$$BarItemImplCopyWithImpl<_$BarItemImpl>(this, _$identity);
}

abstract class _BarItem implements BarItem {
  const factory _BarItem({final int index, final int item}) = _$BarItemImpl;

  @override
  int get index;
  @override
  int get item;
  @override
  @JsonKey(ignore: true)
  _$$BarItemImplCopyWith<_$BarItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
