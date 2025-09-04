enum Language { khmer, english }

// usage example: Dictoinary.welcomePage[setting.getLanguage()]["title"];

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
}
