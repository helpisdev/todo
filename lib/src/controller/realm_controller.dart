part of todo;

/// Configures realm app and manages realms' lifecycle
class RealmController extends GetxController {
  /// Realm app
  static final app = App(
    AppConfiguration(
      'bug_report-uhtgq',
      localAppName: 'bug_report',
    ),
  );

  /// Realm schema
  static final schema = [Todo.schema];

  /// Open realm for the current user.
  Rx<Realm>? _realm;

  @override
  void onInit() {
    super.onInit();
    Realm.logger.level = RealmLogLevel.info;
  }

  /// Client reset handler
  void clientResetHandler(SyncClientResetError error) {
    logger(error.toString());
    try {
      final path = Configuration.defaultRealmPath;
      close();
      Realm.deleteRealm(path);
      unawaited(open(user: RealmController.app.currentUser));
    } catch (err) {
      logger(err.toString());
    }
  }

  /// Find wrapper
  T? find<T extends RealmObject>(Object? primaryKey) {
    if (_realm == null) {
      return null;
    }
    return realm?.find<T>(primaryKey);
  }

  /// All wrapper
  RealmResults<T>? all<T extends RealmObject>() {
    if (_realm == null) {
      return null;
    }
    return realm?.all<T>();
  }

  /// Query wrapper
  RealmResults<T>? query<T extends RealmObject>({
    required String nsQuery,
    List<Object> args = const [],
  }) {
    if (_realm == null) {
      return null;
    }
    return realm?.query<T>(nsQuery, args);
  }

  /// Get back one RealmResult object
  T? one<T extends RealmObject>({
    bool random = false,
    String? nsQuery,
    List<Object> args = const [],
  }) {
    if (_realm == null) {
      return null;
    }
    late final RealmResults<T>? results;
    if (nsQuery != null) {
      results = query<T>(nsQuery: nsQuery, args: args);
    } else {
      results = all<T>();
    }

    T? res;
    if (results != null && results.isNotEmpty) {
      if (random) {
        res = results.random as T?;
      } else {
        res = results.first;
      }
    }

    return res;
  }

  /// Write wrapper
  RealmObject? write(RealmObject? Function() callback) {
    if (_realm == null) {
      return null;
    }
    return realm?.write(callback);
  }

  /// Add wrapper
  RealmObject? add(RealmObject obj) {
    if (_realm == null) {
      return null;
    }
    return write(() => realm?.add(obj));
  }

  /// Opens a realm for the current user
  Future<Rx<Realm>?> open({required User? user}) async {
    if (user != null) {
      final config = Configuration.flexibleSync(
        user,
        schema,
        // path: await _absolutePath('db_${user.id}.realm'),
        syncClientResetErrorHandler: SyncClientResetErrorHandler(
          clientResetHandler,
        ),
      );
      logger('path: ${config.path}');
      // Realm.deleteRealm(config.path);
      _realm = Realm(config).obs;

      if (_realm != null) {
        final r = realm!; // let's ensure we are working on a single realm
        r.subscriptions.update((MutableSubscriptionSet sub) {
          sub.add(r.all<Todo>());
        });
        logger('Starting sync...');
        try {
          // not sure why you want to wait for this?
          await r.subscriptions
              .waitForSynchronization() // first sync subscriptions
              .then((_) => Future.wait([
                    // download/upload (any order will)
                    r.syncSession.waitForDownload(),
                    r.syncSession.waitForUpload(),
                  ]))
              .timeout(
            const Duration(seconds: 25), // one timeout for all steps
            onTimeout: () async {
              logger('Sync failed.');
              Get.showSnackbar(
                GetSnackBar(
                  message: 'Server timeout.',
                  onTap: (snack) => Get.closeCurrentSnackbar(),
                  backgroundColor: Colors.red,
                ),
              );
              close();
              await user.logOut(); // why logout? ..
              throw Exception('Cannot sync.'); // .. this is just a timeout
            },
          );
          logger('Synced.');
          // There is nothing to sync.. are permissions correct on backend?
          // final result = r.all<Todo>();
          // logger('result: ${result.join()}'); // outputs: 'result: '
        } catch (err) {
          logger(err.toString());
        }
      }
    }

    return _realm;
  }

  /// Closes any open realm
  void close() {
    unsubscribe();
    realm?.close();
    _realm = null;
  }

  /// Delete realm subscriptions
  void unsubscribe() {
    realm?.subscriptions.update((MutableSubscriptionSet sub) {
      sub.clear();
    });
  }

  /// Get open realm
  Realm? get realm => _realm?.value;

  @override
  void onClose() {
    super.onClose();
    close();
    Realm.shutdown();
  }
}
