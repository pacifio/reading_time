class ReadingTimeResult {
  String msg;
  double minutes;
  double time;
  int words;

  ReadingTimeResult({
    required this.msg,
    required this.minutes,
    required this.time,
    required this.words,
  });
}

_ansiWordBound(c) {
  return ((' ' == c) || ('\n' == c) || ('\r' == c) || ('\t' == c));
}

/// Predict estimated time to read text
/// String `text` is positional and required
/// int `wpm` is named and not required , default value for `wordsPerMinute` is `200`
/// an average reader can read 200 words per minute
///
/// change `suffix` to customize message
/// change `lessMsg` to customize message if time is less than a minute !
ReadingTimeResult readingTime(
  String text, {
  int wpm = 200,
  String suffix = 'min read',
  String lessMsg = 'less than a minute',
}) {
  var words = 0, start = 0, end = text.length - 1, wordBound, i;
  wordBound = _ansiWordBound;
  while (wordBound(text[start])) {
    start++;
  }
  while (wordBound(text[end])) {
    end--;
  }

  for (i = start; i <= end;) {
    for (; i <= end && !wordBound(text[i]); i++);
    words++;
    for (; i <= end && wordBound(text[i]); i++);
  }

  var minutes = words / wpm;
  var time = minutes * 60 * 1000;
  var displayed = double.parse(minutes.toStringAsFixed(2)).round();

  return (displayed > 0
      ? ReadingTimeResult(
          msg: '$displayed $suffix',
          minutes: minutes,
          time: time,
          words: words,
        )
      : ReadingTimeResult(
          msg: 'less than a minute',
          minutes: minutes,
          time: time,
          words: words,
        ));
}
