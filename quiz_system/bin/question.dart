class Question{
  Question(this._questionText, this._options, this._correctOptionIndex, this._points);

  late final String _questionText;
  late final List<String> _options;
  late final int _correctOptionIndex;
  late final double _points;

  // Getter Methods
  String get getQuestionText => _questionText;
  List<String> get getOptions => _options;
  int get getCorrectOptionIndex => _correctOptionIndex;
  double get getPoints => _points;
}