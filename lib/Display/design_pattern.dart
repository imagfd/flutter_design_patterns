abstract class DesignPattern {
  final String? sourceFilePath;
  final String? ipa;
  final List<String>? topics;

  String testRun();

  const DesignPattern([this.ipa,this.sourceFilePath ,topics]):
  this.topics =    ( topics != null ? topics : const [] ) ;

}
