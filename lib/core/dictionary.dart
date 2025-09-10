import 'package:project0x01/core/configs.dart';

enum Language { khmer, english }


abstract final class Dictionary {
  static const Map<Language, Map<String, String>> welcomePage = {
    Language.english: {
      "title": "Title here",
      "subtitle": "sub title here",
      "button": "continue",
    },
    Language.khmer: {
      "title": "ហេឡូសដថសដ",
      "subtitle": "យេសសដថយេស",
      "button": "ទៅបន្ត",
    },
  };

  static const Map<Language, Map<String, String>> favoriteTopicsPage = {
    Language.english: {
      "title": "Title here",
      "subtitle": "sub title here",
      "back-button": "back",
      "get-started-button": "get started",
    },
    Language.khmer: {
      "title": "ហេឡូសដថសដ",
      "subtitle": "យេសសដថយេស",
      "back-button": "ត្រឡប់ក្រោយ",
      "get-started-button": "ចាប់់ផ្តើម",
    },
  };

  static const Map<Language, Map<Topics, String>> topicStrings = {
    Language.english: {
      Topics.algebra: "Algebra",
      Topics.geometry: "Geometry",
      Topics.inequality: "Inequalitiy",
      Topics.numberTheory: "Number Theory",
    },
    Language.khmer: {
      Topics.algebra: "ពីជគណិត",
      Topics.geometry: "ធរណីមាត្រ",
      Topics.inequality: "វិសមភាព",
      Topics.numberTheory: "ទ្រឹស្តីចំនួន",
    },
  };
}
