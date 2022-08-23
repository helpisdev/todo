part of todo;

@RealmModel()
class _Todo {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late String summary;
  late bool isComplete;
  @MapTo('owner_id')
  late final String ownerId;
}

class Todo extends _Todo with RealmEntity, RealmObject {
  Todo(
    ObjectId id,
    String summary,
    bool isComplete,
    String ownerId,
  ) {
    RealmObject.set(this, '_id', id);
    RealmObject.set(this, 'summary', summary);
    RealmObject.set(this, 'isComplete', isComplete);
    RealmObject.set(this, 'owner_id', ownerId);
  }

  Todo._();

  @override
  ObjectId get id => RealmObject.get<ObjectId>(this, '_id') as ObjectId;

  @override
  set id(ObjectId value) => throw RealmUnsupportedSetError();

  @override
  String get summary => RealmObject.get<String>(this, 'summary') as String;

  @override
  set summary(String value) => RealmObject.set(this, 'summary', value);

  @override
  bool get isComplete => RealmObject.get<bool>(this, 'isComplete') as bool;

  @override
  set isComplete(bool value) => RealmObject.set(this, 'isComplete', value);

  @override
  String get ownerId => RealmObject.get<String>(this, 'owner_id') as String;

  @override
  set ownerId(String value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Todo>> get changes =>
      RealmObject.getChanges<Todo>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;

  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Todo._);
    return const SchemaObject(Todo, 'Todo', [
      SchemaProperty(
        '_id',
        RealmPropertyType.objectid,
        mapTo: '_id',
        primaryKey: true,
      ),
      SchemaProperty('summary', RealmPropertyType.string),
      SchemaProperty('isComplete', RealmPropertyType.bool),
      SchemaProperty('owner_id', RealmPropertyType.string, mapTo: 'owner_id'),
    ]);
  }
}
