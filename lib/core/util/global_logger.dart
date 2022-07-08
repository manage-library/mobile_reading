
import 'package:logger/logger.dart';

var logOutput = ConsoleOutput();
var productionFilter = ProductionFilter();

LogFilter _getLoggerFilter() {
    return DevelopmentFilter();
}

var logger = Logger(
    printer: PrettyPrinter(
        methodCount: 0,
        // number of method calls to be displayed
        errorMethodCount: 8,
        // number of method calls if stacktrace is provided
        lineLength: 120,
        // width of the output
        colors: true,
        // Colorful log messages
        printEmojis: false,
        // Print an emoji for each log message
        printTime: true // Should each log print contain a timestamp
        ),
   // output: LogConsole.wrap(innerOutput: logOutput),
    filter: _getLoggerFilter());