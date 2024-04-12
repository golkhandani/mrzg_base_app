import 'package:get_it/get_it.dart';
import 'package:simple_logger/simple_logger.dart';

GetIt locator = GetIt.instance;

class BasicException implements Exception {
  final String message;
  BasicException({required this.message});
}

class StackLogger {
  final SimpleLogger _logger;
  final String debugName;

  StackLogger(this.debugName) : _logger = SimpleLogger() {
    _logger.formatter = (info) =>
        '${List.generate(100, (_) => '_').join()} \n${_logger.levelPrefixes[info.level]} ${info.message}';
  }

  StackTrace get stack => StackTrace.current;

  String? _getMessage(Object? object) {
    final message = object is Exception
        ? object.toString()
        : object is BasicException
            ? object.message
            : object.toString();
    return message;
  }

  String _getLog(Object? object, StackTrace? stack) {
    return '| $debugName \n==> Type: ${object.runtimeType} \n==> Message: ${_getMessage(object)} \n==> Stack: $stack \n${List.generate(100, (_) => '_').join()}';
  }

  info(Object? object) {
    _logger.info(_getLog(object, StackTrace.empty));
  }

  warn(Object? object) {
    _logger.warning(_getLog(object, stack));
  }

  error(Object? object) {
    _logger.shout(_getLog(object, stack));
  }
}

extension LoggerLocator on GetIt {
  StackLogger console(String debugName) => locator.get<StackLogger>(
        param1: debugName,
      );

  StackLogger get logger => console("GENERAL LOGGER!");
}
