/// Normalizes Spanish search text while keeping the original content intact.
String normalizeSearchText(String value) {
  const accented = 'áàäâéèëêíìïîóòöôúùüûñ';
  const plain = 'aaaaeeeeiiiioooouuuun';
  var result = value.toLowerCase().trim();
  for (var i = 0; i < accented.length; i++) {
    result = result.replaceAll(accented[i], plain[i]);
  }
  return result
      .replaceAll(RegExp(r'[\u0300-\u036f]'), '')
      .replaceAll(RegExp(r'\s+'), ' ');
}
