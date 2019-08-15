/*
BSD 2-Clause License

Copyright (c) 2019, Adib Mohsin
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

_ansiWordBound(c) {
  return ((' ' == c) || ('\n' == c) || ('\r' == c) || ('\t' == c));
}

/// Predict estimated time to read text
/// String `text` is positional and required
/// int `wordsPerMinute` is named and not required , default value for `wordsPerMinute` is 200
/// an average reader can read 200 words per minute
Map readingTime(
  String text, {
  int wordsPerMinute = 200,
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

  var minutes = words / wordsPerMinute;
  var time = minutes * 60 * 1000;
  var displayed = double.parse(minutes.toStringAsFixed(2)).round();

  return (displayed > 0
      ? {
          'text': '$displayed min read',
          'minutes': minutes,
          'time': time,
          'words': words
        }
      : {
          'text': 'less than a minute',
          'minutes': minutes,
          'time': time,
          'words': words
        });
}
