import 'dart:async';

import 'package:mongo_dart/src/core/network/abstract/connection_base.dart';
import 'package:universal_io/io.dart';

import '../error/connection_exception.dart';
import '../info/server_config.dart';

class Connection extends ConnectionBase {
  Connection(int id, ServerConfig serverConfig)
      : super.protected(id, serverConfig);
  @override
  Future<void> connect() async {
    Socket locSocket;
    try {
      locSocket = await Socket.connect(serverConfig.host, serverConfig.port);
    } catch (e) {
      var ex = ConnectionException(
          'Could not connect to ${serverConfig.hostUrl}\n- $e');
      throw ex;
    }

    setSocket(locSocket);
  }
}
