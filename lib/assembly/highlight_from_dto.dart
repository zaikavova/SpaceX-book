import 'package:space_x_book/data/index.dart';
import 'package:space_x_book/domain/index.dart';
import 'package:space_x_book/util/index.dart';

class HighlightFromDTOFactory implements Factory<HighlightDTO, Highlight> {
  @override
  Highlight create(HighlightDTO argument) => Highlight(
      date: DateTime.parse(argument.DateUtc),
      title: argument.title,
      text: argument.details,
      wikiLink: argument.links['wikipedia'],
      pressLink: argument.links['article'],
      redditLink: argument.links['reddit'],);
}
